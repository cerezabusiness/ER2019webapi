class Friendship < ApplicationRecord
    belongs_to :person, :foreign_key => :friend1
    belongs_to :person, :foreign_key => :friend2
end
