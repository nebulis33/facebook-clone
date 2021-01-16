class User < ApplicationRecord
  after_commit :add_default_avatar, on: [:create, :update]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  validates :name, presence: true

  has_many :posts, inverse_of: :author
  has_many :requests_sent, class_name: 'Friendship', foreign_key: :requestor_id, inverse_of: :requestor, dependent: :destroy
  has_many :requests_received, class_name: 'Friendship', foreign_key: :requestee_id, inverse_of: :requestee, dependent: :destroy
  has_many :comments, inverse_of: :author

  has_one_attached :avatar

  has_many :friends_1, -> {merge(Friendship.friends)}, through: :requests_sent, source: :requestee
  has_many :friends_2, -> {merge(Friendship.friends)}, through: :requests_received, source: :requestor
  #has_many :friends, -> {joins(:friends_1).merge(User.friends_2)}
  has_many :pending_sent_requests, -> {merge(Friendship.pending)}, through: :requests_sent, source: :requestee
  has_many :pending_received_requests, -> {merge(Friendship.pending)}, through: :requests_received, source: :requestor

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def friends
    (friends_1.all + friends_2.all).uniq
  end
  
  def posts_feed
    Post.where(author: self).or(Post.where(author: [self.friends])).order(created_at: :desc)
  end

  def add_default_avatar
    unless avatar.attached?
      self.avatar.attach(io: File.open(Rails.root.join("app", "assets", "images", "default.png")), filename: 'default.png', content_type: "image/png")
    end
  end
end
