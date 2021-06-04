class ApplicationController < ActionController::Base

  protect_from_forgery

  def access_denied(exception)
    redirect_to admin_projects_path, alert: exception.message
  end

     before_action :configure_permitted_parameters, if: :devise_controller?

     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :lastname, :phonenumber, :email, :password, :organization_id, :is_female, :date_of_birth, :uname,:attachment)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :lastname, :phonenumber, :email, :password, :current_password,:attachment)}
          end
          def after_sign_in_path_for(resource)
             root_path
           end
           def after_sign_up_path_for(resource)
              new_user_session_path
          end
         def after_sign_out_path_for(resource)
             new_user_session_path
          end
       
end
