class Event < ApplicationRecord
  has_many :persons_events, -> { where profile_id: 2 }
  has_many :people, -> { order(:name) }, through: :persons_events
  has_many :profiles, through: :persons_events
  has_many :multimedia
  has_many :information
  has_many :event_dates, -> { order(:date) }
  has_many :faqs
  has_many :places_events
  has_many :places, through: :places_events
  has_many :activities, through: :places_events
end
