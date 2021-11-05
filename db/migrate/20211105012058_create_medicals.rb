class CreateMedicals < ActiveRecord::Migration[6.0]
  def change
    create_table :medicals do |t|
      t.date :day, null: false       
      t.string :hospital, null: false       
      t.integer :drug_id, null: false       
      t.integer :name_id, null: false       
      t.text :memo, null: false       
      t.references :children, foreign_key: true
      t.timestamps
    end
  end
end
