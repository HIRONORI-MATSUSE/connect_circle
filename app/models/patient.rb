class Patient < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  mount_uploader :image, ImageUploader
  # enum gender: { man: 0, woman: 1}
  enum gender: { 男: 0, 女: 1 }
end
