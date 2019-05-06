json.extract! person, :id, :name, :picture, :description, :phone, :email, :city_id, :company_id, :title, :created_at, :updated_at
json.company do
  json.name person.company.name
end
