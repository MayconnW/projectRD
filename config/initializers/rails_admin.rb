require Rails.root.join('lib', 'rails_admin', 'track_list.rb')
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::TrackList)
RailsAdmin.config do |config|

  config.actions do
    dashboard                     # mandatory
    index
    new do
      except ['Contact']
    end
    export do
      except ['Contact']
    end
    bulk_delete
    show do
      except ['Contact']
    end
    edit do
      except ['Contact']
    end
    delete do
      except ['Contact']
    end
    show_in_app
    track_list
  end
  
  config.authorize_with :pundit
  
  config.authenticate_with do
    warden.authenticate! scope: :user
    if (current_user.role.description != 'admin') && (current_user.role.description != 'user')
      redirect_to main_app.signout_path
    end
  end
  
  config.current_user_method(&:current_user)
  
  config.main_app_name = ["Tracker", "Administration"]
  
  config.parent_controller = 'ApplicationController'
  
end
