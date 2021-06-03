# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    # can :read, :all
      if user.role == "superadmin"
          can :manage, :all
      elsif user.role == "admin"
         can :read, :dashboard 
         can :read,:all
         read_models =[]
         user.read_model.each_with_index{|model,index| read_models[index] = Object.const_get model}
          can :read,read_models
          can :access, :rails_admin 
          can [:admin_list,:user_detail], User    
          create_models = []
          # create_models = user.create_model.select {|model| Object.const_get model}
          user.create_model.each_with_index {|model,index| create_models[index] = Object.const_get model}
          can :create,create_models
          can [:create,:destroy],[Task,Avatar]
        #   cannot :destroy, Organization
      elsif user.role == "employee"
        can :read, :dashboard 
          can :access, :rails_admin 
          can :read,:all
          can :admin_list,User
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
