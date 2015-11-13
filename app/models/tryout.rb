class Tryout < ActiveRecord::Base
  belongs_to :season
  has_many :evaluated_athletes
  has_many :athletes, through: :evaluated_athletes

  validates :location, presence: true
  validates :date, presence: true
  validates :time, presence: true

end
