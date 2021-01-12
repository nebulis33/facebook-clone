class Post < ApplicationRecord
    validates :body, presence: true
    belongs_to :author, class_name: 'User', foreign_key: :user_id, inverse_of: :posts
    has_many :comments
    has_many :likes, as: :likeable
end
