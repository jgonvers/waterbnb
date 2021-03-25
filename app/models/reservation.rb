class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :pedalo
  has_many :reviews, dependent: :destroy

  validates :start_time, :end_time, :accepted, :transaction_price, presence: true
  validates :accepted, acceptance: { accept: ['accepted', 'pending', 'declined'] }
end
