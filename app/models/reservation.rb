class Reservation < ApplicationRecord
  belongs_to :patient
  belongs_to :clinic
  has_many :reservation_clinics, through: :reservations, source: :clinic
  has_many :reservation_patients, through: :reservations, source: :patient
end
