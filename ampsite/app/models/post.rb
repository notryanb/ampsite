class Post < ActiveRecord::Base
  belongs_to :user, :foreign_key => :user_id
  belongs_to :topic, :foreign_key => :topic_id
  has_many :comments, as: :commentable

  validates_presence_of :title, :user_id, :topic_id, :content
  validates_length_of :title, :within => 5..140

  # has_attached_file :postimage, :styles => { :medium => "300x300>", :thumb => "80x80#" }
  # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


  default_scope { order(:created_at => :desc) }


  # Takes custom tags and formats for HTML

  def format_url_tags
    url_start = "[url]"
    url_end = "[/url]"
    p self.content
    url = self.content[/#{Regexp.escape(url_start)}(.*?)#{Regexp.escape(url_end)}/m, 1]
    p url
    self.content.gsub!("[url]", '<a href="http://').gsub!("[/url]", '">' + url + '</a>')
  end

  def has_spaces?(input)
    input == input.split(" ").join
  end


end