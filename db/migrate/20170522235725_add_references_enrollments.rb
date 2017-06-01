class AddReferencesEnrollments < ActiveRecord::Migration[5.0]
  def change
    add_reference :enrollments, :student, index: true
    add_reference :enrollments, :cycle, index: true
  end
end
