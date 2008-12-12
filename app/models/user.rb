class User < ActiveRecord::Base
  has_many :forum_topics
  has_many :forum_posts
end
 
