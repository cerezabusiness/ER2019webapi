class Checkin < ApplicationRecord
  belongs_to :person
  belongs_to :event_date
end
