class ApplicationController < ActionController::Base

	  protect_from_forgery with: :null_session


     before_action :configure_permitted_parameters, if: :devise_controller?

     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :lastname, :phonenumber, :email, :password, :organization_id, :is_female, :date_of_birth, :uname,:attachment,:role)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :lastname, :phonenumber, :email, :password, :current_password,:attachment,:role)}
          end
          def after_sign_in_path_for(resource)
             # stored_location_for(resource) || edit_user_registration_path 
             rails_admin_path
             # app_dashboard_index_path
           end
           def after_sign_up_path_for(resource)
              new_user_session_path
          end
         def after_sign_out_path_for(resource)
             new_user_session_path
          end
       
end
