class Member::ForumTopicsController < Member::BaseController
  
  before_filter :find_forum_topic, :only => [:show, :destroy, :edit, :update]
  before_filter :forum_topic_user?, :only => [:destroy, :edit, :update]
  def create
    @forum_topic = ForumTopic.new(params[:forum_topic].merge({:user_id => current_user.id, :forum_id => params[:forum_id]}))
    render :update do |page|
      if @forum_topic.save
        page.replace_html :flashmsg, "Topic has been created."
        page.insert_html :top, :forum_topics,:partial => '/member/forum_topics/forum_topic', :object => @forum_topic
        page.replace_html :errors, ""
        page['forum_topic_form'].reset
      else
        page.replace_html :flashmsg, ""
        page.replace_html :errors, @forum_topic.errors.full_messages.join("<br />")
      end
    end      
  end
  
  def show
    @forum_post = ForumPost.new
  end
  
  def destroy
    render :update do |page|
      if @forum_topic.destroy
        page.replace_html :flashmsg, "Topic has been deleted."
        page.replace_html "forum_topic_#{@forum_topic.id}", ""
      end
    end     
  end
  
  def edit
    render :update do |page|
      page.replace_html "forum_topic_#{@forum_topic.id}", ""
      page.replace_html "forum_topic_form_div", :partial => "/member/forum_topics/forum_topic_form"
    end
  end
  
  def update
    render :update do |page|
      if @forum_topic.update_attributes(params[:forum_topic])
        page.replace_html :flashmsg, "Topic has been updated."
        page.replace_html "forum_topic_#{@forum_topic.id}", :partial => '/member/forum_topics/forum_topic', :object => @forum_topic
        page.replace_html :errors, ""
        @forum_topic = ForumTopic.new
        page.replace_html "forum_topic_form_div", :partial => "/member/forum_topics/forum_topic_form" 
      else
        page.replace_html :flashmsg, ""
        page.replace_html :errors, @forum_topic.errors.full_messages.join("<br />")
      end
    end     
  end
  private ###########################

  def forum_topic_user?
    unless @forum_topic.user==current_user
      flash[:error] = "Sorry, we cannot process your request."
      redirect_to member_forums_path
    end
  end

  def find_forum_topic
    @forum_topic = ForumTopic.find(params[:id]) rescue nil
    unless @forum_topic
      flash[:error] = "Sorry, the page cannot be found."
      redirect_to member_forums_path
    end
  end
 
end
 
