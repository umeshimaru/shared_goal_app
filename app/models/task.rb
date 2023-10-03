class Task < ApplicationRecord
  belongs_to :weekly_goal
  validates :start_time   , presence: true
  validates :end_time     , presence: true
  validates :task         , presence: true
end
