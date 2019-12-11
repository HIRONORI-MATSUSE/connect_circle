class RenameQualificationColumnToQualifications < ActiveRecord::Migration[5.2]
  def change
    rename_column :qualifications, :qualification, :name
  end
end
