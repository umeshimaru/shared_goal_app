class MonthlyGoal < ApplicationRecord

  belongs_to :user
  has_many :weekly_goals
  mount_uploader :image,ImageUploader

  validates :monthly_goal , presence:true, length: { maximum: 100 }
  validates :penalty_name , presence:true, length: { maximum: 100 }
  



def calc_days(goal_achieved_at)
  today = Date.today 
  @days_until_achievement =  goal_achieved_at - today 

end



end
