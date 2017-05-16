class CreateDetailCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :detail_courses do |t|
      t.integer :firs_practice
      t.integer :second_practice
      t.integer :third_practice
      t.integer :first_exam
      t.integer :second_exam
      t.integer :permanent
      t.integer :unique_exam
      t.float :average
      t.references :student, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true

      t.timestamps
    end
  end
end
