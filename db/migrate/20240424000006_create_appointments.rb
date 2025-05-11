class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.references :patient, null: false, foreign_key: true
      t.date :appointment_date, null: false
      t.time :start_time
      t.time :end_time
      t.string :status, null: false
      t.text :purpose
      t.text :notes
      t.references :created_by, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end 