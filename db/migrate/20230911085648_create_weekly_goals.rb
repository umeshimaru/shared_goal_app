class CreateWeeklyGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :weekly_goals do |t|
      t.string :weekly_goal
      t.datetime :start_time
      t.references :user, null: false, foreign_key: true
      t.references :monthly_goal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
