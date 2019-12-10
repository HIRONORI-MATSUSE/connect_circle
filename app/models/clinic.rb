class Clinic < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :informations, dependent: :destroy
  mount_uploader :image, ImageUploader
end