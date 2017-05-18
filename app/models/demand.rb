class Demand < ApplicationRecord
  belongs_to :student, foreign_key: 'students_id'
  belongs_to :executive, foreign_key: 'executive_id'

  validates :subject, :body, presence: true
end
