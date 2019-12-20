class AddTimeToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :end, :datetime
  end
end
