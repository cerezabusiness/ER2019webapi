class Event < ApplicationRecord
  has_many :persons_events
  has_many :people, through: :persons_events
  has_many :profiles, through: :persons_events
  has_many :multimedium
  has_many :informations
  has_many :event_dates
  has_many :faqs
  has_many :places_events
  has_many :places, through: :places_events
  has_many :activities, through: :places_events
end
