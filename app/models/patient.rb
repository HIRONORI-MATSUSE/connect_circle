class Patient < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  mount_uploader :image, ImageUploader
  enum gender: { 男: 0, 女: 1 }
end
