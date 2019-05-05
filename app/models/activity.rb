class Activity < ApplicationRecord
  belongs_to :event_date
  belongs_to :places_event
end
