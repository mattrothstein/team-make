class EvaluatedAthlete < ActiveRecord::Base
  belongs_to :tryout
  belongs_to :athlete
end
