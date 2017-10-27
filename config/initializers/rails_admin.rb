RailsAdmin.config do |config|

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
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
