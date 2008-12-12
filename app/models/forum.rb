class Forum < ActiveRecord::Base
  has_many :forum_topics
  def post_count
    count = 0
    forum_topics.each{|topic| count = count+topic.forum_posts.count}
    return count
  end
end
