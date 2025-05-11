class CreateMedicalCases < ActiveRecord::Migration[7.1]
  def change
    create_table :medical_cases do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.text :description
      t.string :status, null: false
      t.timestamps
    end
  end
end 