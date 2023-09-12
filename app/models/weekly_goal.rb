class WeeklyGoal < ApplicationRecord
  belongs_to :user
  belongs_to :monthly_goal
end
