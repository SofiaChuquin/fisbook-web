class Course < ApplicationRecord
  belongs_to :teacher, foreign_key: 'teachers_id'
  belongs_to :cycle, foreign_key: 'cycles_id'
  has_many :detail_courses, foreign_key: 'courses_id'

  validates :name, :credits, presence: true
  validates :type_evaluation, inclusion: { in: %w(A B C D E F Cargo Único), message: 'Tipo de evaluación no válida' }
  validates :hours, numericality: { only_integer: true }
end
