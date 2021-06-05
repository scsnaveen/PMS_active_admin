ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation,:role,create_model:[],update_model:[],read_model:[],delete_model:[]

  action_item :only => :index do
    link_to('Admins list', admins_list_admin_admin_users_path)
  end

  collection_action :admins_list, method: :get do
    @admins = AdminUser.where(:role=>"Admin")
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
      # f.inputs
      f.input :role, as: :select, collection: ['Super Admin', 'Admin'] 
      f.input :create_model, as: :select, multiple: true, collection: ['Project','Task','Avatar','Organization'] 
      f.input :update_model, as: :select, multiple: true, collection: ['Project','Task','Avatar','Organization'] 
      f.input :read_model, as: :select, multiple: true, collection: ['Project','Task','Avatar','Organization'] 
      f.input :delete_model, as: :select, multiple: true, collection: ['Project','Task','Avatar','Organization'] 
    end
    f.actions
  end

end
