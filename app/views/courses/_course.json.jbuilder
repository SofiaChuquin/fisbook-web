json.extract! course, :id, :name, :credits, :type_evaluation, :hours, :created_at, :updated_at
json.url course_url(course, format: :json)
