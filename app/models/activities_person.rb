class ActivitiesPerson < ApplicationRecord
  belongs_to :activity
  belongs_to :person
end
