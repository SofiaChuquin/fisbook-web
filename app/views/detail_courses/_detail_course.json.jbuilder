json.extract! detail_course, :id, :first_practice, :second_practice, :third_practice, :first_exam, :second_exam, :permanent, :unique_exam, :defer_exam, :average, :created_at, :updated_at
json.url detail_course_url(detail_course, format: :json)
