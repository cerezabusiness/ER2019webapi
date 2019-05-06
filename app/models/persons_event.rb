class PersonsEvent < ApplicationRecord
  belongs_to :person
  belongs_to :event
  # belongs_to :profile
end
