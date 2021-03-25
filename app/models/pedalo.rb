class Pedalo < ApplicationRecord
  belongs_to :owner, :class_name => "User"
  has_many :reservations
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :name, :description, :address, :price_per_hour, presence: true
end
