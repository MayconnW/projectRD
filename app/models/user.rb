class User < ApplicationRecord
  
  belongs_to :role
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         
  validates :email, presence: true, uniqueness: true, :on => :create
  validates :password,  presence: true, confirmation: true, :on => :create
  validates :password_confirmation, presence: true, :on => :create
  validates :password, confirmation: true, :on => :update
  validates :password_confirmation, presence: true, :on => :update, if: :password_changed?
  validates :name, presence: true
  validates :role, presence: true
  
  def password_changed?
    !password.blank?
  end
  
  RailsAdmin.config do |config|
    config.model 'User' do
      list do
        field :id
        field :name
        field :email
        field :role
      end
      edit do
        field :email
        field :name
        field :password
        field :password_confirmation
        field :role do
          visible do
            bindings[:view]._current_user.role.description == 'admin'
          end
        end
      end
    end
  end
  
end
