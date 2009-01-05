class Forum < ActiveRecord::Base
  has_many :forum_topics
  validates_presence_of :name
  validates_uniqueness_of :name
  def post_count
    count = 0
    forum_topics.each{|topic| count = count+topic.forum_posts.count}
    return count
  end
end
