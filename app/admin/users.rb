ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :failed_attempts, :unlock_token, :locked_at, :name, :lastname, :phonenumber, :organization_id, :uname, :date_of_birth, :is_female, :image
  
   member_action :user_details, method: :get do
    @user = User.find(params[:id])
    redirect_to admin_user_path(@user)
    render "user_details"
  end

  controller do
     def user_details
      @user = User.find(params[:id])
     end
  end
  action_item :view,only: :show  do
    link_to 'Users details', user_details_admin_user_path(user),method: :get if user.uname?
  end


  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :failed_attempts, :unlock_token, :locked_at, :name, :lastname, :phonenumber, :organization_id, :uname, :date_of_birth, :is_female, :image, :attachment, :role, :create_model, :read_model, :update_model, :delete_model, :gauth_secret, :gauth_enabled, :gauth_tmp, :gauth_tmp_datetime, :otp_backup_codes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
