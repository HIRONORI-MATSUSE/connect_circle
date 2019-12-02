class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.bigint :patient_id
      t.bigint :clinic_id
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
