class Spot < ActiveRecord::Base
  belongs_to :team
  belongs_to :athlete
  enum invite_status: [:pending, :accept, :decline]
end
