class Person < ApplicationRecord
  belongs_to :company
  has_many :persons_events
  has_many :events, through: :persons_events
  has_many :profiles, through: :persons_events
  has_many :activities_people
  has_many :activities, through: :activities_people
end
