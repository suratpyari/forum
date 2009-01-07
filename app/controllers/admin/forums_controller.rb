class Admin::ForumsController < ApplicationController
 
  before_filter :find_forum, :except => [:index, :new, :create]
  def index
    @forums = Forum.paginate :page => params[:page] ? params[:page] : 1, :order => 'updated_at DESC'
  end
  
  def new
    @forum = Forum.new
    render :template => "/admin/forums/form"
  end
  
  def create
    @forum = Forum.new(params[:forum])
    if @forum.save
      flash[:ok] = "Forum has been created"
      redirect_to admin_forums_path
    else
      render :action => :new
    end
  end
  
  def edit
    render :template => "/admin/forums/form"
  end
  
  def update
    if @forum.update_attributes(params[:forum])
      flash[:ok] = "Forum has been created"
      redirect_to admin_forums_path
    else
      render :action => :edit
    end
  end
  
  def destroy
    if @forum.destroy
      flash[:ok] = "Forum has been deleted"
    end
    redirect_to admin_forums_path
  end
  
 private ###########################
 
  def find_forum
    @forum = Forum.find(params[:id]) rescue nil
    unless @forum
      flash[:error] = "Sorry, the page cannot be found."
      redirect_to admin_forums_path
    end
  end
 
end
