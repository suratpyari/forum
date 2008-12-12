class Member::ForumsController < ApplicationController
 
  before_filter :find_forum, :only => [:show]
  def index
    @forums = Forum.find(:all)
  end
  
  def show
    @forum_topic = ForumTopic.new
  end
  
 private ###########################
 
  def find_forum
    @forum = Forum.find(params[:id]) rescue nil
    unless @forum
      flash[:error] = "Sorry, the page cannot be found."
      redirect_to member_forums_path
    end
  end
 
end
 