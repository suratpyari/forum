class ForumTopic < ActiveRecord::Base
  has_many :forum_posts
  belongs_to :user
  belongs_to :forum
end
 
