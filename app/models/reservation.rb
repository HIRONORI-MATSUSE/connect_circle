class Reservation < ApplicationRecord
  belongs_to :patient
  belongs_to :clinic
  has_many :reservation_clinics, through: :reservations, source: :clinic
  has_many :reservation_patients, through: :reservations, source: :patient
  scope :recent, -> { where(start: Time.zone.now..1.month.since) }
  scope :today, -> { where(start: DateTime.now.strftime("%Y-%m-%d") ) }
 

  def double_booking?
    date_reservation = []
    Reservation.all.each do |reservation|
      date_reservation.push([*(reservation.start.to_i)-1..(reservation.end_time.to_i)-1])
    end
    result = []
    date_reservation.each do |reservation|
      result.push(reservation & [*self.start.to_i..self.end_time.to_i])
    end 
    result.flatten.empty?
  end
end