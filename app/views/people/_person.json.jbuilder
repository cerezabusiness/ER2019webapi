json.extract! person, :id, :name, :picture, :description, :phone, :email, :city_id, :company_id, :title, :created_at, :updated_at
json.url person_url(person, format: :json)
