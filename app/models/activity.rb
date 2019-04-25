class Activity < ApplicationRecord
  belongs_to :time_range
  belongs_to :places_event
end
