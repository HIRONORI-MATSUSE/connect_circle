class CreateInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :informations do |t|
      t.text :comment
      t.references :clinic, foreign_key: true

      t.timestamps
    end
  end
end
