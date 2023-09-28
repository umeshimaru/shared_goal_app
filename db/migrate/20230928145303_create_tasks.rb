class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :task
      t.datetime :start_time
      t.datetime :end_time
      t.references :weekly_goal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
