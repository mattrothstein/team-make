class Club < ActiveRecord::Base
  has_secure_password
  has_many :teams
  validates :club_name, presence: true, uniqueness: true
  validates :director, presence: true
  validates :email, presence: true, uniqueness: true
  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "blank_avatar.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
end
