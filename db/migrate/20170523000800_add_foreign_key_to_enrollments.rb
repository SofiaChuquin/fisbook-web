class AddForeignKeyToEnrollments < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :enrollments, :students
    add_foreign_key :enrollments, :cycles
  end
end
