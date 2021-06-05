class ApplicationPolicy
  attr_reader :admin_user, :record

  def initialize(admin_user, record)
    @admin_user = admin_user
    @record = record
  end

  def index?
    if @admin_user.role == "Super Admin"
      return true
    elsif @admin_user.role == "Admin"
      if AdminUser.read_model_array(@admin_user.id).include?(@record).present?
        return true
      end
    end
  end

  def show?
    if @admin_user.role == "Super Admin"
      return true
    elsif @admin_user.role == "Admin"
        return true if AdminUser.read_model_array(@admin_user.id).include?(@record.class).present?
    end 
  end
  
  def create?
    if @admin_user.role == "Super Admin"
     return true
    elsif @admin_user.role == "Admin"
      return true if AdminUser.create_model_array(@admin_user.id).include?(@record.class).present?
    end
  end

  def new?
    if @admin_user.role == "Super Admin"
    create?
    elsif @admin_user.role == "Admin"
    create? if AdminUser.create_model_array(@admin_user.id).include?(@record.class).present? 
    end
  end

  def update?
    if @admin_user.role == "Super Admin"
      return true
    elsif @admin_user.role == "Admin"
      return true if AdminUser.update_model_array(@admin_user.id).include?(@record.class).present?         
    end
  end

  def edit?
    if @admin_user.role == "Super Admin"
    update?
    elsif @admin_user.role == "Admin"
    update? if AdminUser.update_model_array(@admin_user.id).include?(@record.class).present?

    end
  end

  def destroy?
    if @admin_user.role == "Super Admin"
      return true
    elsif @admin_user.role == "Admin"
      return true if AdminUser.delete_model_array(@admin_user.id).include?(@record.class).present?
    end
  end
  # def admin_list?
  #   @admin_user.role=="Super Admin"
  # end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      # if @user.role=="Super Admin"
      #   scope.all
      # elsif @user.role == "Admin"
        # scope.all if AdminUser.delete_model_array(@user.id).include?(@scope)
        # scope.all if AdminUser.update_model_array(@user.id).include?(@scope)
        # scope.all if AdminUser.create_model_array(@user.id).include?(@scope)
        # scope.all if AdminUser.read_model_array(@user.id).include?(@scope)
        scope.all
        # scope.include?(AdminUser.delete_model_array(@user.id))
        # scope.include?(@user.update_model)
        # scope.include?(@user.delete_model)
        # scope.include?(@user.read_model)
      # scope.none
      # end
    end
  end
end
