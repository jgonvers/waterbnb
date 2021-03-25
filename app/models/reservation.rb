class TimeSlotValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add(:start_time, "start time must be before end time") if record.start_time >= record.end_time
    state = false
    Reservation.where(pedalo: record.pedalo).each do |record2|
      state = true if in_common?(record, record2)
    end
    record.errors.add(:start_time, "time slot already used") if state
  end

  private

  def in_common?(record1, record2)
    return false if record1.id == record2.id

    !((record2.end_time < record1.start_time) || (record2.start_time > record1.end_time))
  end
end

class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :pedalo
  has_many :reviews, dependent: :destroy

  validates :start_time, :end_time, :accepted, :transaction_price, presence: true
  validates :accepted, acceptance: { accept: ['accepted', 'pending', 'declined'] }
  validates_with TimeSlotValidator
end
