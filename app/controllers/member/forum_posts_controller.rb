class Member::ForumPostsController < ApplicationController
  
  def create
    @forum_post = ForumPost.new(params[:forum_post].merge({:user_id => current_user.id, :forum_topic_id => params[:forum_topic_id]}))
    if @forum_post.save
      flash[:ok] = "Post has sbeen created."
      redirect_to member_forum_topic_path(@forum_post.forum_topic)
    else
      render :template => '/member/forum_topics/show'
    end
  end
  
  def destroy
    @forum_post = ForumPost.find(params[:id]) rescue nil
    unless @forum_post
      flash[:error] = "Sorry, the page cannot be found."
      redirect_to :back
    end
    if @forum_post.destroy
      flash[:ok] = "Topic has been deleted."
    end
    redirect_to member_forum_topic_path(@forum_post.forum_topic)
  end
 
end
 
