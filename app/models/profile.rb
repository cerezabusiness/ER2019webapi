class Profile < ApplicationRecord
  has_many :persons_events
  has_many :events, through: :persons_events
  has_many :people, through: :persons_events
end
