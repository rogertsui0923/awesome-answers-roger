class User < ApplicationRecord
  # has_secure_password does a few things:
  # it automatically adds 'password' and 'password_confirmation' attribute accessors
  # it automatically adds a presence validator on the password
  # it automatically adds a confirmation validator if you add a password confirmation field
  # when password is provided 'has_secure_password' will generate a salt and a digest of the password + salt and it will store it in the password_digest field
  # it gives us a handy method called 'authenticate' that will help us check if the password is correct
  has_secure_password

  has_many :questions, dependent: :nullify

  before_validation :downcase_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX

  def full_name
    "#{first_name} #{last_name}".strip.titleize
  end
  private
  def downcase_email
    self.email&.downcase!
  end

end
