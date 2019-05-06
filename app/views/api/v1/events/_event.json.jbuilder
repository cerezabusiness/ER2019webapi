json.extract! event, :id, :name, :email, :phone, :created_at, :updated_at
json.event_dates event.event_dates do |date|
  json.partial! "api/v1/event_dates/event_date", event_date: date
end
json.activities event.activities do
  json.partial! "api/v1/activities/activities", activities: event.activities
end
json.exhibitors event.people do |exhibitor|
  json.partial! "api/v1/people/person", person: exhibitor
end
json.information event.information do |info|
  json.partial! "api/v1/information/information", information: info
end
json.url api_v1_event_url(event, format: :json)
