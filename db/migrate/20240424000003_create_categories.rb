class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.text :title, null: false
      t.boolean :status, default: true
      t.timestamps
    end
  end
end 