class Athlete < ActiveRecord::Base
  attr_accessor :remember_token
  attr_accessor :avatar_file_name
  has_one :tryout
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
                                    default_url: "/images/blank_avatar.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_one :spot
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 155 },
              format: { with: VALID_EMAIL_REGEX },
              uniqueness: { case_senstive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
##below validates images, paperclip gem
  validates :avatar, attachment_presence: true
  validates_with AttachmentPresenceValidator, attributes: :avatar
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes

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

  def has_attached_file(name, options = {})
  end

end
