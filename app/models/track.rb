class Track < ApplicationRecord
  
  RailsAdmin.config do |config|
    config.model 'Track' do
      visible false
    end
  end
end
