class Pedalo < ApplicationRecord
  belongs_to :owner, :class_name => "User"
  has_many :reservations
  validates :name, :description, :price_per_hour, :photo, presence: true
  validates :price_per_hour, numericality: { greater_than_or_equal_to: 15 }
end
