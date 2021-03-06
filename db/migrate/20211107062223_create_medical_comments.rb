class CreateMedicalComments < ActiveRecord::Migration[6.0]
  def change
    create_table :medical_comments do |t|
      t.text :content, null: false
      t.references :user, foreign_key: true
      t.references :medical, foreign_key: true
      t.references :child, foreign_key: true 
      t.timestamps
    end
  end
end
