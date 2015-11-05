class Tryout < ActiveRecord::Base
  belongs_to :team
  has_many :athletes
end
