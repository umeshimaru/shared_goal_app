class CreateMonthlyGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :monthly_goals do |t|
      t.string :monthly_goal
      t.date :goal_achieved_at
      t.string :penalty_name
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
