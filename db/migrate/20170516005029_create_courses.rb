class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.float :credits
      t.string :type_evaluation
      t.integer :hours
      t.references :teacher, index: true, foreign_key: true
      t.references :cycle, index: true, foreign_key: true

      t.timestamps
    end
  end
end
