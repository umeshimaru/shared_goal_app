class CreateMonthlyGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :monthly_goals do |t|
      t.string　goal_achieved_at :monthly_goal
      t.string :penalty_name
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
