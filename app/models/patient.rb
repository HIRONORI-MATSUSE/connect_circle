class Patient < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  mount_uploader :image, ImageUploader
  enum gender: { 男: 0, 女: 1 }
  validates :name, presence: true, presence: {message: "入力してください"}
  validates :name_kana, presence: true, presence: {message: "入力してください"}
  validates :gender, presence: true
  validates :birthday, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, presence: {message: "入力してください"}
  
  extend OrderAsSpecified
  scope :patient_name_search, -> (name_search) {
    next if name_search.blank?
    where(['name LIKE ? OR name_kana LIKE ?', "%#{name_search}%","%#{name_search}%" ])
  }

  def self.revive_active_record(arr)
    ids = arr.map(&:id)
    Patient.where(id: ids).order_as_specified(id: ids)
  end

  def default_image
    binding.pry
    if patient.image.nil?
      File.open('public/default.png') do |f|
      self.avatar = f
      end
    self.save!
    end
  end
end
