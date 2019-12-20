class ChangeDataPhoneNumberToDoctors < ActiveRecord::Migration[5.2]
  def change
    change_column :doctors, :phone_number, :bigint
  end
end
