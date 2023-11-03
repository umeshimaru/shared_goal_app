class User < ApplicationRecord
  has_one  :monthly_goal
  has_many :weekly_goals, through: :monthly_goal
  has_one  :sender_relationships,   class_name:  "Relationship",
                                    foreign_key: "sender_id",
                                    dependent:   :destroy

  has_one  :reciever_relationships, class_name:  "Relationship",
                                    foreign_key: "reciever_id",
                                    dependent:   :destroy



                           

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable 



         validates :name , presence:true,  uniqueness: true


 scope :find_others, -> (user_input){ where("name LIKE ?", "#{user_input}%") }
         

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




def self.ransackable_attributes(auth_object = nil)
  %w[name ]
end



end 

