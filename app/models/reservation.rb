class Reservation < ApplicationRecord
  belongs_to :patient
  belongs_to :clinic
  has_many :reservation_clinics, through: :reservations, source: :clinic
  has_many :reservation_patients, through: :reservations, source: :patient
  scope :recent, -> { where(start: Time.zone.now..1.month.since) }
  scope :today, -> { where(start: Time.zone.now) }
end
