class PlacesEvent < ApplicationRecord
  belongs_to :place
  belongs_to :event
  has_many :activities
end
