class DashboardPolicy < ApplicationPolicy
	def dashboard?
   true
  end
  def index?
   true
  end
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
