class CreateQualifications < ActiveRecord::Migration[5.2]
  def change
    create_table :qualifications do |t|
      t.string :qualification
      t.references :doctor, foreign_key: true

      t.timestamps
    end
  end
end
