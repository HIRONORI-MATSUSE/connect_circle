class DropTableInformations < ActiveRecord::Migration[5.2]
  def change
    drop_table :informations
  end
end
