class Student < ApplicationRecord
  belongs_to :person, foreign_key: 'people_id'
  has_many :notes, foreign_key: 'student_id'
  has_many :demands, foreign_key: 'student_id'
  has_many :enrollments, foreign_key: 'student_id'

  accepts_nested_attributes_for :person

  validates :turn, inclusion: { in: %w(Mañana Tarde Noche) }
end
