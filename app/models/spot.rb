class Spot < ActiveRecord::Base
  belongs_to :team
  has_one :athlete
  enum invite_status: [:pending, :accept, :decline] 
end
