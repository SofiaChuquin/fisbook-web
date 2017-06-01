class Executive < ApplicationRecord
  has_many :demands, foreign_key: 'executive_id'
  belongs_to :person, foreign_key: 'people_id'

  accepts_nested_attributes_for :person

  validates :position, presence: true, inclusion: { in: %w(Secretario Director), message: 'Puesto no válido.' }
end
