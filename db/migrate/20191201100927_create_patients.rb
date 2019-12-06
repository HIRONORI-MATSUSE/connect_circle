class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :name_kana
      t.integer :gender
      t.date :birthday
      t.string :address
      t.integer :phone_number
      t.text :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
