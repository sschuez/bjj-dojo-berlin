class CompetitionPolicy < ApplicationPolicy
	class Scope < Scope
    def resolve
      # if user.admin?
        scope.all
      # else
        # scope.where(user: user)
      # end	
      # For a multi-tenant SaaS app, you may want to use:
      # scope.where(user: user)
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    true
  end

  # def index
  # 	true
  # end

end