class Relationship < ApplicationRecord
  belongs_to :sender,   class_name: "User"
  belongs_to :reciever, class_name: "User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
