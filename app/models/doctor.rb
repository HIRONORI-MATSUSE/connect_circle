class Doctor < ApplicationRecord
  belongs_to :user
  belongs_to :clinic
  # enum gender: { man: 0, woman: 1}
  enum gender: { 男: 0, 女: 1 }
end
