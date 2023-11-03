class Relationship < ApplicationRecord
  belongs_to :sender,     class_name: "User"
  belongs_to :reciever,   class_name: "User"
  validates :sender_id,   presence: true
  validates :reciever_id, presence: true



  def sender_or_reciever?
    @sender    = Relationship.find_by(sender_id:   current_user.id)
    @reciever  = Relationship.find_by(reciever_id: current_user.id)
    
   
  end




end

