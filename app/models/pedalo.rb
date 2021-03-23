class Pedalo < ApplicationRecord
  belongs_to :owner, :class_name => "User"
  has_many :reservations
  validates :name, :description, :price_per_hour, presence: true
end
