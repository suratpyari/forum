class ForumPost < ActiveRecord::Base
  belongs_to :forum_topic
  belongs_to :user
  validates_presence_of :body
  cattr_reader :per_page
  @@per_page = 10
end
