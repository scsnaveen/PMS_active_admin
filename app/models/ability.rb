# frozen_string_literal: true

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
          can :read, :dashboard 
          can :read,:all
      elsif admin_user.role == "Admin"
         can :read, :dashboard 
         can :read,:all
         can :update,Project
      else
        can :read, :dashboard 
        can :read,:all
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
