class Club < ActiveRecord::Base
  has_secure_password
  has_many :seasons, dependent: :destroy
  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>", icon: "50x50>" }, default_url: "vball.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
  validates :club_name, presence: true, uniqueness: true
  validates :director, presence: true
  validates :email, presence: true, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 155 },
              format: { with: VALID_EMAIL_REGEX },
              uniqueness: { case_senstive: false }
  validates :password, presence: true, length: { minimum: 6 }
  before_save { self.email = email.downcase }
end
