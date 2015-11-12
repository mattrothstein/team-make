class Athlete < ActiveRecord::Base
  before_save :get_age
  attr_accessor :remember_token
  attr_accessor :avatar_file_name
  has_many :evaluated_athletes
  has_many :tryouts, through: :evaluated_athletes
  has_one :spot

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
                                    default_url: "blank_avatar.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 155 },
              format: { with: VALID_EMAIL_REGEX },
              uniqueness: { case_senstive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  VALID_PHONE_REGEX = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/
  validates :telephone, format: { with: VALID_PHONE_REGEX}

  # validates_with AttachmentSizeValidator, attributes: :avatar, less_than: .megabytes

  ## This below will return the hash digest of given string
  def Athlete.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def Athlete.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = Athlete.new_token
    update_attribute(:remember_digest, Athlete.digest(remember_token))
  end

  def authenticated?
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest.is_password?(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def has_attached_file(avatar, options = {})
  end

    def get_age
      self.dob
      now = Time.now.utc.to_date
      athlete_age = now.year - self.dob.year - ((now.month > self.dob.month || (now.month == self.dob.month && now.day >= self.dob.day)) ? 0 : 1)

      self.age = athlete_age
  end
end
