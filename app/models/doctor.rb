class Doctor < ApplicationRecord
  belongs_to :user
  belongs_to :clinic
  has_many :qualifications
  mount_uploader :image, ImageUploader
  enum gender: { 男: 0, 女: 1 }
end
