class User < ActiveRecord::Base
  has_many :events

  attr_accessor :remember_token
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6}, allow_nil: true
  # validates_presence_of :email, :acceptance
  validates_presence_of :acceptance, allow_nil: true

  # Returns the hash digest of a given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  # validates_uniqueness_of :email



  # attr_accessor :remember_token
  # before_create :create_activation_digest
  # before_save { self.email = email.downcase }
  #
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence:   true,
  #                   format:     { with: VALID_EMAIL_REGEX },
  #                   uniqueness: {case_sensitive: false }
  # has_secure_password
  # validates :password, length: { minimum: 6}
  # validates_presence_of :password, :email, :acceptance
  # #
  # validates_uniqueness_of :email
  # #
  #
  #

  #
  # def self.authenticate(email, password)
  #
  #   @user = User.find_by_email(email)
  #
  #   if !@user.nil?
  #     if @user.authenticate(password)
  #       return @user
  #     end
  #   end
  #
  #   return nil
  # end
  #
  # private
  #
  # def create_activation_digest
  #   # Create the token and digest
  # end

end
