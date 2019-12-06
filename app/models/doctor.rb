class Doctor < ApplicationRecord
  belongs_to :user
  belongs_to :clinic
  # enum gender: { man: 0, woman: 1}
end
