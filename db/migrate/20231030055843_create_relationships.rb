class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.integer :sender_id
      t.integer :reciever_id

      t.timestamps
    end
    add_index :relationships, [:sender_id, :reciever_id], unique: true
  end
end
