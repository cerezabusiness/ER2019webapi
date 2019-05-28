class Person < ApplicationRecord
  belongs_to :company, optional: true
  has_many :persons_events, dependent: :destroy
  has_many :events, through: :persons_events
  has_many :profiles, through: :persons_events
  has_many :activities_people, dependent: :destroy
  has_many :activities, through: :activities_people
  has_many :friendships ,:foreign_key => :friend1
  has_many :friends, through: :friendships,source: :person
end
