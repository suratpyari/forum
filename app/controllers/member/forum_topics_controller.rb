class Member::ForumTopicsController < ApplicationController
  
  before_filter :find_forum_topic, :only => [:show, :destroy]
  
  def create
    @forum_topic = ForumTopic.new(params[:forum_topic].merge({:user_id => current_user.id, :forum_id => params[:forum_id]}))
    if @forum_topic.save
      flash[:ok] = "Topic has sbeen created."
      redirect_to member_forum_path(@forum_topic.forum)
    else
      render :template => '/member/forums/show'
    end
  end
  
  def show
    @forum_post = ForumPost.new
  end
  
  def destroy
    if @forum_topic.destroy
      flash[:ok] = "Topic has been deleted."
    end
    redirect_to member_forum_path(@forum_topic.forum)
  end
  
 private ###########################
 
 def find_forum_topic
  @forum_topic = ForumTopic.find(params[:id]) rescue nil
  unless @forum_topic
    flash[:error] = "Sorry, the page cannot be found."
    redirect_to member_forums_path
  end
 end
 
end
 
