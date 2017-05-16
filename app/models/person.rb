class Person < ApplicationRecord
  has_many :students, foreign_key: 'people_id'
end
