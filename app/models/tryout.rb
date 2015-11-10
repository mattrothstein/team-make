class Tryout < ActiveRecord::Base
  belongs_to :season
  has_many :evaluated_athletes
  has_many :athletes, through: :evaluated_athletes
end
