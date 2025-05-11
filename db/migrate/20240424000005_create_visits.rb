class CreateVisits < ActiveRecord::Migration[7.1]
  def change
    create_table :visits do |t|
      t.references :medical_case, null: false, foreign_key: true
      t.date :visit_date, null: false
      t.text :notes
      t.text :vitals
      t.text :treatment
      t.timestamps
    end
  end
end 