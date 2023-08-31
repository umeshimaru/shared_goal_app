class MonthlyGoal < ApplicationRecord
  belongs_to :user
  mount_uploader :image,ImageUploader



def calc_days(goal_achieved_at)
  today = Date.today 
  @days_until_achievement =  goal_achieved_at - today 

end



end
