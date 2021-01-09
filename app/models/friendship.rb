class Friendship < ApplicationRecord
    validates :requestor_id, uniqueness: {scope: :requestee_id, message: "has already sent a request to this user."}
    #validates :requestee_id, uniqueness: {scope: :requestor_id} #need to make this unique both directions
end
