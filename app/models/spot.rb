class Spot < ActiveRecord::Base
  belongs_to :team
  has_one :athlete
end
