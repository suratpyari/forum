class ForumTopic < ActiveRecord::Base
  has_many :forum_posts
  belongs_to :user
  belongs_to :forum
  validates_presence_of :title
  validates_uniqueness_of :title, :scope => :forum_id
  cattr_reader :per_page
  @@per_page = 5
end
 
