class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :name_kana
      t.integer :gender
      t.date :birthday
      t.integer :phone_number
      t.text :comment
      t.string :image
      t.boolean :admin, default: false
      t.references :user, foreign_key: true
      t.references :clinic, foreign_key: true

      t.timestamps
    end
  end
end
