class Post < ActiveRecord::Base
  belongs_to :user, :foreign_key => :user_id
  belongs_to :topic, :foreign_key => :topic_id
  has_many :comments, as: :commentable

  validates_presence_of :title, :user_id, :topic_id, :content
  validates_length_of :title, :within => 5..140

end