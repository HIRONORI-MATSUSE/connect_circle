class ChangeDataPhoneNumberToPatients < ActiveRecord::Migration[5.2]
  def change
    change_column :patients, :phone_number, :bigint
  end
end
