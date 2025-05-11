class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :name, null: false
      t.string :gender
      t.date :date_of_birth
      t.text :address
      t.string :email
      t.string :phone
      t.text :notes
      t.string :emergency_contact
      t.timestamps
    end
  end
end 