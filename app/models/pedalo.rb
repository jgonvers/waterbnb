class Pedalo < ApplicationRecord
  belongs_to :owner, :class_name => "User"
  has_many :reservations

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :name, :description, :price_per_hour, :address, presence: true
  validates :price_per_hour, numericality: { greater_than_or_equal_to: 15 }
  has_one_attached :photo
end
