class Student < ApplicationRecord
  belongs_to :person, foreign_key: 'people_id'
  has_many :detail_courses, foreign_key: 'students_id'
  has_many :demands, foreign_key: 'students_id'
  has_many :enrollments, foreign_key: 'students_id'

  validates :turn, inclusion: { in: %w(Mañana Tarde Noche) }
end
