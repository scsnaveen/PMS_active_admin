class AddAvatarToProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :avatars do |t| 
      t.belongs_to :project 
      t.string :attachment
      t.timestamps
      end 
  end
end
