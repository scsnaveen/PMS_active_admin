class AddUsernameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :uname, :string
    add_column :users, :date_of_birth, :datetime
    add_column :users, :is_female, :boolean, default: false
  end
end
