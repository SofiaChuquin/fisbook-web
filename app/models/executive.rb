class Executive < ApplicationRecord
  has_many :demands, foreign_key: 'executive_id'

  validates :position, presence: true, inclusion: { in: %w(Secretario, Director), message: 'Puesto no válido.' }
end
