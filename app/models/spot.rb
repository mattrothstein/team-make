class Spot < ActiveRecord::Base
  belongs_to :team
  has_one :athlete
  enum invite_status: [pending: 0, accept: 1, decline: 2] 
end
