# Add your custom routes here. If in config/routes.rb you would
# add <tt>map.resources</tt>, here you would add just <tt>resources</tt>
 
resources :forums, :has_many => :forum_topics
resources :forum_topics, :has_many => :forum_posts
resources :forum_posts
 
namespace(:admin) do |admin|
  admin.resources :forums
end
 
namespace(:member) do |member|
  member.resources :forums, :has_many => :forum_topics
  member.resources :forum_topics, :has_many => :forum_posts
  member.resources :forum_posts
end
 
