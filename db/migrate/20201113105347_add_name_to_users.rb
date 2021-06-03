class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :lastname, :string,null: false, default: ""
    add_column :users, :phonenumber, :string,null: false, default: ""

  end
end
