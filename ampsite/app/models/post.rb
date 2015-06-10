class Post < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  belongs_to :topic
  has_many :comments

  validates_presence_of :title, :author, :content
  validates_length_of :title, :within => 5..140

end