class AddFullcalendarToWeeklyGoals < ActiveRecord::Migration[6.1]
  def change
    add_column :weekly_goals, :start_date, :datetime
    add_column :weekly_goals, :end_date, :datetime
  end
end
