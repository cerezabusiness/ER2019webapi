class Place < ApplicationRecord
  has_many :places_events
  has_many :events, through: :places_events
  has_many :activities, through: :places_events
end
