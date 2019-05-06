class Activity < ApplicationRecord
  belongs_to :event_date
  belongs_to :places_event
  has_many :activities_people
  has_many :people, through: :activities_people
end
