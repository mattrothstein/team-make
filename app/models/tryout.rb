class Tryout < ActiveRecord::Base
  belongs_to :season
  has_many :evaluated_athletes, dependent: :destroy
  has_many :athletes, through: :evaluated_athletes

  validates :location, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :price, presence: true, numericality: {only_integer: true}

end
