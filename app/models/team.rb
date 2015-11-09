class Team < ActiveRecord::Base
  belongs_to :season
  has_many :spots
end
