class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  has_many :pedalos, dependent: :destroy, :foreign_key => "owner_id"
  has_many :reservations
  validates :first_name, :last_name, :role, :email, :encrypted_password, presence: true
  validates :role, acceptance: { accept: ['admin', 'client', 'owner'] }
end
