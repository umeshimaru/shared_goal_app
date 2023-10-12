class WeeklyGoal < ApplicationRecord
  belongs_to :user
  belongs_to :monthly_goal
  has_many :tasks, dependent: :destroy

  validates :weekly_goal , presence:true, length: { maximum: 100 }

  scope :find_update_record, ->(previous_weekly_goal,start_time,id) {
    where(weekly_goal: previous_weekly_goal).where(start_time: start_time).where(user_id: id).where(monthly_goal_id: id) }




end
