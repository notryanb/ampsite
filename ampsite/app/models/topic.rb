class Topic < ActiveRecord::Base
  has_many :posts

  validates_presence_of :title
  validates_presence_of :description
end