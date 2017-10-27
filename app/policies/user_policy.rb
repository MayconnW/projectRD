class UserPolicy < ApplicationPolicy
  
  class Scope < Scope
    def resolve
      if user.role.admin
        User.all
      else
        User.where(id: user.id)
      end
    end
  end
  
  def show?
    user.present? && (record == user || user.role.admin)
  end
  
  def update?
    user.present? && (record == user || user.role.admin)
  end
  
  def rails_admin?(action)
    
    if user.role.admin
      super
    else
      case action
        when :index 
          user.role.description == 'user'
        when :show
          show?
        when :edit
          update?
        else
          super
      end  
    end
    
  end
  
end
