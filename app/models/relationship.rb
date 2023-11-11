class Relationship < ApplicationRecord
  belongs_to :sender,     class_name: "User"
  belongs_to :reciever,   class_name: "User"
  validates :sender_id,   presence: true, uniqueness: true
  validates :reciever_id, presence: true, uniqueness: true





end

