class User < ApplicationRecord

  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP

end