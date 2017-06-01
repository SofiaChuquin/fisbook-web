class Teacher < ApplicationRecord
  belongs_to :person, foreign_key: 'people_id'
  has_many :courses, foreign_key: 'teacher_id'

  accepts_nested_attributes_for :person

  validates :rank, inclusion: { in: %w(Contratado Nombrado), message: 'Rango no válido.' }
end
