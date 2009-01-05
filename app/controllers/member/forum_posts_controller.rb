class Member::ForumPostsController < ApplicationController
  
  before_filter :find_forum_post, :only => [:destroy, :edit, :update]
  before_filter :forum_post_user?, :only => [:destroy, :edit, :update]
  
  def create
    @forum_post = ForumPost.new(params[:forum_post].merge({:user_id => current_user.id, :forum_topic_id => params[:forum_topic_id]}))
    render :update do |page|
      if @forum_post.save
        page.replace_html :flashmsg, "Post has been created."
        page.insert_html :bottom, :forum_posts,:partial => '/member/forum_posts/forum_post', :object => @forum_post
        page.replace_html :errors, ""
        page['forum_post_form'].reset
      else
        page.replace_html :flashmsg, ""
        page.replace_html :errors, @forum_post.errors.full_messages.join("<br />")
      end
    end
  end
  
  def destroy
    render :update do |page|
      if @forum_post.destroy
        page.replace_html :flashmsg, "Post has been deleted."
        page.replace_html "forum_post_#{@forum_post.id}", ""
      end
    end  
  end
  
  def edit
    render :update do |page|
      page.replace_html "forum_post_#{@forum_post.id}", ""
      page.replace_html "forum_post_form_div", :partial => "/member/forum_posts/forum_post_form"
    end
  end
  
  def update
    render :update do |page|
      if @forum_post.update_attributes(params[:forum_post])
        page.replace_html :flashmsg, "Post has been updated."
        page.replace_html "forum_post_#{@forum_post.id}", :partial => '/member/forum_posts/forum_post', :object => @forum_post
        page.replace_html :errors, ""
        @forum_post = ForumPost.new
        page.replace_html "forum_post_form_div", :partial => "/member/forum_posts/forum_post_form" 
      else
        page.replace_html :flashmsg, ""
        page.replace_html :errors, @forum_post.errors.full_messages.join("<br />")
      end
    end     
  end
  
  private ###########################

  def forum_post_user?
    unless @forum_post.user==current_user
      flash[:error] = "Sorry, we cannot process your request."
      redirect_to member_forums_path
    end
  end

  def find_forum_post
    @forum_post = ForumPost.find(params[:id]) rescue nil
    unless @forum_post
      flash[:error] = "Sorry, the page cannot be found."
      redirect_to member_forums_path
    end
  end
 
end
 
