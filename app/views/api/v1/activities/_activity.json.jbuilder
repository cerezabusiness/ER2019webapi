json.extract! activity, :id, :name, :description, :start_time, :end_time, :event_date_id, :places_event_id, :created_at, :updated_at
json.event_date do
  json.date activity.event_date.date
end

json.exhibitors activity.people do |person|
  json.id person.id
  json.name person.name
  json.email person.email
  json.picture person.picture
  json.company do
    json.name person.company.name
  end
end
