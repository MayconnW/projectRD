class Role < ApplicationRecord
  
  def admin
    return true if self.description == 'admin'
    return false
  end
  
  def name 
    "#{self.description}"
  end
  
  RailsAdmin.config do |config|
    config.model 'Role' do
      visible false
    end
  end
  
end
