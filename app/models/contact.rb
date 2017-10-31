class Contact < ApplicationRecord
  
  validates :email, presence: true, uniqueness: true, :on => :create
  validates :cookie, presence: true, uniqueness: true, :on => :create
  
  has_many :tracks, :foreign_key => :cookie, :primary_key => :cookie
  
  RailsAdmin.config do |config|
    config.model 'Contact' do
      list do
        field :id do
          column_width 100
        end
        field :email do
          formatted_value do
            path = bindings[:view].track_list_path(model_name: 'Contact', id: bindings[:object].id)
            bindings[:view].link_to(bindings[:object].email, path)
          end
        end
      end
    end
  end
  
end
