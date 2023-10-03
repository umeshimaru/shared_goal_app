class WeeklyGoal < ApplicationRecord
  belongs_to :user
  belongs_to :monthly_goal
  has_many :task, dependent: :destroy

  validates :weekly_goal , presence:true, length: { maximum: 100 }
end
