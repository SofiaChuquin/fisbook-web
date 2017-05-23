class Enrollment < ApplicationRecord
  belongs_to :student, foreign_key: 'student_id'
  belongs_to :cycle, foreign_key: 'cycle_id'

  validates :voucher, presence: true
  validates :active, inclusion: { in: [ true, false ], message: 'Dato no válido.' }
end
