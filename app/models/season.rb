class Season < ActiveRecord::Base
  belongs_to :club
  has_many :teams
  has_many :tryouts

  validates :year, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: Date.today.year }
end
