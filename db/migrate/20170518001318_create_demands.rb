class CreateDemands < ActiveRecord::Migration[5.0]
  def change
    create_table :demands do |t|
      t.string :subject
      t.string :body
      t.string :document
      t.references :student, index: true, foreign_key: true
      t.references :executive, index: true, foreign_key: true
      t.references :note, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
