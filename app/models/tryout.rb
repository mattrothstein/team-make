class Tryout < ActiveRecord::Base
  belongs_to :season
  has_many :athletes
end
