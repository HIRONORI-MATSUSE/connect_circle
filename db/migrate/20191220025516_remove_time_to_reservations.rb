class RemoveTimeToReservations < ActiveRecord::Migration[5.2]
  def change
     remove_column :reservations, :time, :time
  end
end
