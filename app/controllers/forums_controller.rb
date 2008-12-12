class ForumsController < ApplicationController
 
  before_filter :find_forum, :only => [:show]
  def index
    @forums = Forum.find(:all)
    render :template => '/member/forums/index' if current_user
  end
  
  def show
    @forum_topic = ForumTopic.new
    render :template => '/member/forums/show' if current_user
  end
  
 private ###########################
 
  def find_forum
    @forum = Forum.find(params[:id]) rescue nil
    unless @forum
      flash[:error] = "Sorry, the page cannot be found."
      redirect_to forums_path
    end
  end
 
end
 
