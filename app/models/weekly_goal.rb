class WeeklyGoal < ApplicationRecord
  belongs_to :user
  belongs_to :monthly_goal

  validates :weekly_goal , presence:true, length: { maximum: 100 }
end
