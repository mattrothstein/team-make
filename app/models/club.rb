class Club < ActiveRecord::Base
  has_secure_password
  has_many :teams
  validates :club_name, presence: true, uniqueness: true
  validates :director, presence: true
  validates :email, presence: true, uniqueness: true
end
