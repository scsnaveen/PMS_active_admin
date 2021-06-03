class AddCrudToUsers < ActiveRecord::Migration[6.0]
  def change
  	    add_column :users, :create_model, :string, array: true, default: []
   	    add_column :users, :read_model, :string, array: true, default: []
   	    add_column :users, :update_model, :string, array: true, default: []
   	    add_column :users, :delete_model, :string, array: true, default: []
  end
end
