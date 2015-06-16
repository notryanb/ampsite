class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :comments

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "80x80>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates_presence_of :username
  validates_length_of :username, :within => 5..25
  validates_uniqueness_of :username

  validates_presence_of :email
  validates_length_of :email, :maximum => 100
  validates_format_of :email, :with => EMAIL_REGEX
  validates_uniqueness_of :email

  validates_presence_of :password, if: :password
  validates_length_of :password, :within => 8..20, if: :password
  validates_confirmation_of :password, if: :password

  def has_avatar?
    if self.avatar.url != "/avatars/original/missing.png" 
      return true
    else
      return false
    end
  end

  def post_and_comment_count
    self.posts.count + self.comments.count
  end

end