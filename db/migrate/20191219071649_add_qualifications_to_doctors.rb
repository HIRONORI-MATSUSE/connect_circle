class AddQualificationsToDoctors < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors, :qualification, :text
  end
end
