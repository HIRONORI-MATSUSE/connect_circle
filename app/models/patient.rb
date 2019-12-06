class Patient < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  mount_uploader :image, ImageUploader
  # enum gender: { man: 0, woman: 1}
end
