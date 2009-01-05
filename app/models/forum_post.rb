class ForumPost < ActiveRecord::Base
  belongs_to :forum_topic
  belongs_to :user
  validates_presence_of :body
end
