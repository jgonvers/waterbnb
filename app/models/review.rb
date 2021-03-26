class Review < ApplicationRecord
  belongs_to :reservation
  delegate :pedalo, to: :reservation

  validates :rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 5
  }

  validates :content, presence: true
end
