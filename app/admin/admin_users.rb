ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation,:role

  action_item :only => :index do
    link_to('Admins list', admins_list_admin_admin_users_path)
  end
  
  collection_action :admins_list, method: :get do
    render "admins_list"
  end
  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :role
      f.input :password_confirmation
    end
    f.actions
  end

end
