json.partial! "/api/v1/activities/activities", activities: @activities

# json.activities @activities do |activity|
#   json.extract! activity, :id, :name, :description, :start_time, :end_time, :event_date_id, :places_event_id, :created_at, :updated_at
# end
