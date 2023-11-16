class User < ApplicationRecord
  has_one  :monthly_goal
  has_many :weekly_goals, through: :monthly_goal
  has_one  :sender_relationships,   class_name:  "Relationship",
                                    foreign_key: "sender_id",
                                    dependent:   :destroy

  has_one  :reciever_relationships, class_name:  "Relationship",
                                    foreign_key: "reciever_id",
                                    dependent:   :destroy

  has_many :active_notifications,  class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy


                           

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable 



         validates :name , presence:true,  uniqueness: true


 scope :find_others, -> (user_input,user){ where("name LIKE ? AND NOT id  = ?" ,"#{user_input}%", user.id) } 
        

def collect_user_events(user_weekly_goals)
  events = []
  user_weekly_goals.each do |weekly_goal|
    events.push(weekly_goal)
  weekly_goal.tasks.each do |task|
    events.push(task)
    end
  end 
  events
end 

def  create_notification_follow!(current_user,friend_id)
  notification = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, friend_id, 'follow'])
  if notification.blank?
    notification = current_user.active_notifications.new(
      visited_id: friend_id,
      action: 'follow'
    )
    notification.save if notification.valid?
    
  end
end


def can_follow?(other_user,user)

  user = Relationship.where("(sender_id = ? OR reciever_id  = ?) OR (sender_id = ? OR reciever_id = ?)", user.id, user.id, other_user, other_user)
   user.empty? ? true : false 
end

def follow(others,relationship_params,user)
  relationship = Relationship.new(relationship_params)
  if relationship.save
    user.create_notification_follow!(user,others) 
  end
end 

def self.ransackable_attributes(auth_object = nil)
  %w[name ]
end



end 

