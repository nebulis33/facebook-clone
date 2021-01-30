class Comment < ApplicationRecord
    validates :content, presence: true
    belongs_to :author, class_name: 'User', foreign_key: :user_id, inverse_of: :comments
    belongs_to :post
    has_many :likes, as: :likeable

    def like_count
        self.likes.size
    end
end
