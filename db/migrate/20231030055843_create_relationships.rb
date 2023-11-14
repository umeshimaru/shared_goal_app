class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.integer :sender_id ,  unique: true
      t.integer :reciever_id, unique: true

      t.timestamps
    end
    add_index :relationships, [:sender_id, :reciever_id], unique: true
  end
end
