class Team < ActiveRecord::Base
  belongs_to :club
  has_one :tryout
  has_many :spots
end
