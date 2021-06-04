# frozen_string_literal: true
# require 'active_admin/main_controller'

# module ActiveAdmin

#     class MainController < ActiveAdmin::ApplicationController
#         # rescue for the admins who cannot access  
#         rescue_from CanCan::AccessDenied do |exception|
#             redirect_to active_admin.dashboard_path
#             flash[:alert] = 'Access denied.'
#         end
#     end
# end

class Ability
  include CanCan::Ability

  def initialize(admin_user)
    # can :manage, :all
    # can :read, :dashboard 
    # can :read,:all
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    # can :read, :all
      if admin_user.role == "Super Admin"
          can :manage, :all
      elsif admin_user.role == "Admin"
         can :read,[Project]
#         can :create, AdminUser.create_models do |arr|
#           puts arr.inspect
#   arr.create_model(admin_user.id).present? { |el| puts el.inspect can?(:create, el) }
# end

        can :create,AdminUser.create_model_array(admin_user.id)
        can :read,AdminUser.read_model_array(admin_user.id)
        can :update,AdminUser.update_model_array(admin_user.id)
        can :destroy,AdminUser.delete_model_array(admin_user.id)
      else
        # can :read,[Project]
        can :read, :dashboard 
      end
      
   
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
