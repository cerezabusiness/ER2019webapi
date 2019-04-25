json.extract! multimedium, :id, :name, :url, :multimedia_type_id, :event_id, :created_at, :updated_at
json.url multimedium_url(multimedium, format: :json)
