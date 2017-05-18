class Course < ApplicationRecord
  belongs_to :teacher, foreign_key: 'teachers_id'
  belongs_to :cycle, foreign_key: 'cycles_id'
  has_many :detail_courses, foreign_key: 'courses_id'

  validates :name, presence: true
  validates :credits, presence: true, numericality: { only_float: true, greater_than: 0.0 }
  validates :type_evaluation, inclusion: { in: %w(A B C D E F Cargo Único), message: 'Tipo de evaluación no válida' }
  validates :hours, numericality: { only_integer: true, greater_than: 0 }
end
