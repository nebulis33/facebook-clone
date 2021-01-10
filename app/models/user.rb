class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  validates :name, presence: true

  has_many :posts, inverse_of: :author
  has_many :requests_sent, class_name: 'Friendship', foreign_key: :requestor_id, inverse_of: :requestor, dependent: :destroy
  has_many :requests_received, class_name: 'Friendship', foreign_key: :requestee_id, inverse_of: :requestee, dependent: :destroy

  has_many :friends, -> {merge(Friendship.friends)}, through: :requests_sent, source: :requestee
  has_many :pending_sent_requests, -> {merge(Friendship.pending)}, through: :requests_sent, source: :requestee
  has_many :pending_received_requests, -> {merge(Friendship.pending)}, through: :requests_received, source: :requestor
end
