class Friendship < ApplicationRecord
    validates :requestor_id, uniqueness: {scope: :requestee_id, message: "has already sent a request to this user."}
    #validates :requestee_id, uniqueness: {scope: :requestor_id} #need to make this unique both directions

    belongs_to :requestor, class_name: 'User', foreign_key: :requestor_id
    belongs_to :requestee, class_name: 'User', foreign_key: :requestee_id

    scope :friends, -> {where('status = ?', true)}
    scope :pending, -> {where('status = ?', false)}
end
