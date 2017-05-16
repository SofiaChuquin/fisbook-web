json.extract! person, :id, :lastname, :name, :dni, :phone, :email, :gender, :state, :rol, :created_at, :updated_at
json.url person_url(person, format: :json)
