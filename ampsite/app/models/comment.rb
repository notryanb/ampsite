class Comment < ActiveRecord::Base
  belongs_to :user, :foreign_key => :user_id
  belongs_to :commentable, polymorphic: true

  validates_presence_of :user, :content

end