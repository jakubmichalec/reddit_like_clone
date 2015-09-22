class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  attr_accessor :remember_token
  has_secure_password

  has_many :links
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_FORMAT }, uniqueness: { case_sensitive: false }
  validates :password, presence: true

  #Remember me, generate random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
