module RailsAdmin
  module Config
    module Actions
    class AdminList < RailsAdmin::Config::Actions::Base
    	RailsAdmin::Config::Actions.register(self)
        register_instance_option :collection do  #	this is for specific record
          true
        end
        

        register_instance_option :controller do
         Proc.new do
         	def initialize(user)
          	render @get.admin_list,layout:true
         
         end
         end
     end
         register_instance_option :link_icon do
          # font awesome icons. but an older version
          'icon-envelope' 
        end
      end
      class UserDetail < RailsAdmin::Config::Actions::Base
    	RailsAdmin::Config::Actions.register(self)
        register_instance_option :collection do  #	this is for specific record
          true
        end
        

        register_instance_option :controller do
         Proc.new do
         	def initialize(user)
          	render @get.user_detail,layout:true
         end
         end
     end
     register_instance_option :only do
          User
        end
         register_instance_option :link_icon do
          # font awesome icons. but an older version
          'fa fa-address-card' 
        end
      end
    end
  end
end