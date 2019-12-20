class Information < ApplicationRecord
  belongs_to :clinic
  validates :comment, presence: true
end
