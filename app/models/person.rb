class Person < ApplicationRecord
  has_many :students, foreign_key: 'people_id'
  has_many :teachers, foreign_key: 'people_id'

  validates :lastname, :name, presence: true
  validates :dni, presence: true, uniqueness: true, length: { maximum: 8 }, numericality: { only_integer: true }
  validates :phone, length: { maximum: 9 }, numericality: { only_integer: true }
  validates :email, email_format: { message: 'Correo no válido.' }
  validates :gender, inclusion: { in: %w(Masculino Femenino), message: 'Género no válido.' }
  validates :state, inclusion: { in: %w(Activo Inactivo), message: 'Estado no válido.' }
  validates :rol, inclusion: { in: %w(Estudiante Docente Directivo), message: 'Rol no válido.' }
end
