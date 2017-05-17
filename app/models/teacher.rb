class Teacher < ApplicationRecord
  belongs_to :person, foreign_key: 'people_id'
  has_many :courses, foreign_key: 'teachers_id'

  validates :rank, inclusion: { in: %w(Contratado Nombrado), message: 'Rango no válido.' }
end
