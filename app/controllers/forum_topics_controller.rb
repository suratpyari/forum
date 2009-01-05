
 class ForumTopicsController < ApplicationController
  
  def show
    @forum_topic = ForumTopic.find(params[:id]) rescue nil
    unless @forum_topic
      flash[:error] = "Sorry, the page cannot be found."
      redirect_to forums_path
    end
    render :template => '/member/forum_topics/show'
  end
  
 private ###########################
 
end
