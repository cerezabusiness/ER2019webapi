json.array! @activities do |activity|
  json.partial! "/api/v1/activities/activity", activity: activity
end
