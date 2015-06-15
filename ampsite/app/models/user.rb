class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :comments

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates_presence_of :username
  validates_length_of :username, :within => 5..25
  validates_uniqueness_of :username

  validates_presence_of :email
  validates_length_of :email, :maximum => 100
  validates_format_of :email, :with => EMAIL_REGEX
  validates_uniqueness_of :email

  validates_presence_of :password
  validates_length_of :password, :within => 8..20
  validates_confirmation_of :password

  validates_length_of :signature, :maximum => 200
  validates_length_of :location, :within => 4..20
end