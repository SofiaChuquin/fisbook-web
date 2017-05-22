class Note < ApplicationRecord
  belongs_to :student, foreign_key: 'students_id'
  belongs_to :course, foreign_key: 'courses_id'

  validates :first_practice, :second_practice, :third_practice, :first_exam, :second_exam, :permanent, :unique_exam, :defer_exam, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 20 }
  validates :average, numericality: { only_float: true, greater_than_or_equal_to: 0.0, less_than_or_equal_to: 20.0 }
end
