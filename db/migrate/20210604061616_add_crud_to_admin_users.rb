class AddCrudToAdminUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :admin_users, :create_model, :string, array: true, default: []
    add_column :admin_users, :read_model, :string, array: true, default: []
    add_column :admin_users, :update_model, :string, array: true, default: []
    add_column :admin_users, :delete_model, :string, array: true, default: []
  end
end
