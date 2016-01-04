class User < ActiveRecord::Base
  has_many :events

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6}
  validates_presence_of :password, :email, :acceptance
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
