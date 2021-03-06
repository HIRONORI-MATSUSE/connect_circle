class Clinic < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :reservation_patients, through: :reservations, source: :patient
  has_many :informations, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  has_many :doctors
  mount_uploader :image, ImageUploader
  scope :name_address_search, -> (name_address_search) {
    next if name_address_search.blank?
    where(['name LIKE ? OR address LIKE ?', "%#{name_address_search}%", "%#{name_address_search}%" ])
  }
end