class ChangeDataPhoneNumberToClinics < ActiveRecord::Migration[5.2]
  def change
     change_column :clinics, :phone_number, :bigint
  end
end
