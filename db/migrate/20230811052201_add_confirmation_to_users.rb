class AddConfirmationToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :confirmed_at, :datetime
    add_column :users, :unconfirmed_email, :string
  end
end 