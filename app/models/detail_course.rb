class DetailCourse < ApplicationRecord
  belongs_to :student, foreign_key: 'students_id'
  belongs_to :course, foreign_key: 'courses_id'

  validates :firs_practice, :second_practice, :third_practice, :first_exam, :second_exam, :permanent, :unique_exam, numericality: { only_integer: true, minimum: 0, maximum: 20 }
  validates :average, numericality: { only_float: true, minimum: 0, maximum: 20 }
end
