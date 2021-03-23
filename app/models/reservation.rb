class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :pedalo

  validates :start_time, :end_time, :accepted, :transaction_price, presence: true
  validates :accepted, acceptance: { accept: ['accepted', 'pending', 'declined'] }
end
