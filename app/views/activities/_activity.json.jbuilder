json.extract! activity, :id, :name, :description, :start_time, :end_time, :person_id, :place_id, :event_date_id, :places_event_id, :created_at, :updated_at
json.url activity_url(activity, format: :json)
