class Doctor < ApplicationRecord
  belongs_to :user
  belongs_to :clinic
  mount_uploader :image, ImageUploader
  enum gender: { 男: 0, 女: 1 }
  after_save :default_image

  extend OrderAsSpecified
  scope :doctor_name_search, -> (name_search) {
    next if name_search.blank?
    where(['name LIKE ? OR name_kana LIKE ?', "%#{name_search}%","%#{name_search}%" ])
  }

  def self.revive_active_record(arr)
    ids = arr.map(&:id)
    Doctor.where(id: ids).order_as_specified(id: ids)
  end

  def default_image
    binding.pry
    if doctor.image.nil?
      File.open('public/default.png') do |f|
      self.avatar = f
      end
    self.save!
    end
  end
end
