class Team < ActiveRecord::Base
  belongs_to :season
  has_many :spots

  validates :age_group, presence: true, numericality: { only_integer: true, greater_than: 9, less_than: 18 }
  validates :roster_size, presence: true
  validates :name, presence:true
  validates :coach, presence:true
end
