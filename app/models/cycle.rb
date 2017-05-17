class Cycle < ApplicationRecord
  has_many :courses, foreign_key: 'cycles_id'

  validates :name, presence: true
  validates :semester, numericality: { only_integer: true }, length: { maximum: 1 }
  validates :year, numericality: { only_integer: true }, length: { maximum: 4 }
end
