class RemoveNameFromReservations < ActiveRecord::Migration[5.2]
  def change
    remove_column :reservations, :name, :string
  end
end
