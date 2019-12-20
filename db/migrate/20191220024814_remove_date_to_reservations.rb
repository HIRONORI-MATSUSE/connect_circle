class RemoveDateToReservations < ActiveRecord::Migration[5.2]
  def change
    remove_column :reservations, :date, :date
  end
end
