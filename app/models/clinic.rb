class Clinic < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :informations, dependent: :destroy
  has_many :doctors
  mount_uploader :image, ImageUploader
  scope :name_address_search, -> (name_address_search) {
    next if name_address_search.blank?
    where(['name LIKE ? OR address LIKE ?', "%#{name_address_search}%", "%#{name_address_search}%" ])
  }
end