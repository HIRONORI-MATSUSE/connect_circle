class Clinic < ApplicationRecord
  has_many :reservations, dependent: :destroy
end
