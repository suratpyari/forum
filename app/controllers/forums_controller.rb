class ForumsController < ApplicationController
 
  before_filter :find_forum, :only => [:show]
  def index
    @forums = Forum.paginate :page => params[:page] ? params[:page] : 1, :order => 'updated_at DESC'
    render :template => '/member/forums/index'
  end
  
  def show
    @forum_topic = ForumTopic.new
    render :template => '/member/forums/show'
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
 
