class ForumPostsController < ApplicationController
  
  before_filter :find_forum_post, :only => :show
  def show
  	render :template => "/member/forum_posts/show"
  end
  private #########################
  
  def find_forum_post
    @forum_post = ForumPost.find(params[:id]) rescue nil
    unless @forum_post
      flash[:error] = "Sorry, the page cannot be found."
      redirect_to forums_path
    end
  end
 
end
 
