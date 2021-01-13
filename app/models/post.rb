class Post < ApplicationRecord
    validates :body, presence: true
    belongs_to :author, class_name: 'User', foreign_key: :user_id, inverse_of: :posts
    has_many :comments
    accepts_nested_attributes_for :comments
    has_many :likes, as: :likeable

    def like_count
        self.likes.count
    end

    def posts_feed
        Post.where(author: current_user)
    end
end
