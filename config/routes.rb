require 'api_constraints'
Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  root 'rails_admin/main#dashboard'
  
  namespace :api, defaults: { format: :json } do
    scope module: :v1,
            constraints: ApiConstraints.new(version: 1, default: true) do
      resources :contacts, :only => [:create]
      post 'track' => 'contacts#track'
    end
  end
  
end
