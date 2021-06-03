class AddImageToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :attachment, :string
  end
end
