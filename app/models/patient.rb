class Patient < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  mount_uploader :image, ImageUploader
  enum gender: { 男: 0, 女: 1 }
  
  extend OrderAsSpecified
  scope :patient_name_search, -> (name_search) {
    next if name_search.blank?
    where(['name LIKE ? OR name_kana LIKE ?', "%#{name_search}%","%#{name_search}%" ])
  }

  def self.revive_active_record(arr)
    ids = arr.map(&:id)
    Patient.where(id: ids).order_as_specified(id: ids)
  end
end
