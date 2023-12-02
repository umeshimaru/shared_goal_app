class Relationship < ApplicationRecord

  belongs_to :sender,     class_name: "User", foreign_key: "sender_id"
  belongs_to :reciever,   class_name: "User", foreign_key: "reciever_id"
  validates :sender_id,   presence: true, uniqueness: true
  validates :reciever_id, presence: true, uniqueness: true


  def self.get_sender(friend_request_reciever)
    if !friend_request_reciever.nil?
        friend_request_reciever.sender
    end 
  end 


  

end

