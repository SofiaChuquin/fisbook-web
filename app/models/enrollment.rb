class Enrollment < ApplicationRecord
  belongs_to :student, foreign_key: 'students_id'
  belongs_to :cycle, foreign_key: 'cycles_id'

  validates :voucher, presence: true
end
