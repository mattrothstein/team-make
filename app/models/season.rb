class Season < ActiveRecord::Base
  belongs_to :club
  has_many :teams
  has_one :tryout
end
