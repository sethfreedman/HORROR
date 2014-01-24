class CommentsController < ApplicationController
 
  def index
  
  	conditions = {}
  	conditions[:continent] = params[:continent] unless params[:continent].blank?
  	conditions[:country] = params[:country] unless params[:country].blank?
  	conditions[:decade] = params[:decade] unless params[:decade].blank?
  	conditions[:genre] = params[:genre] unless params[:genre].blank?
  	conditions[:media] = params[:media] unless params[:media].blank?
  	conditions[:market] = params[:market] unless params[:market].blank?

	if conditions.empty?
		@comments = Comment.find(:all)
	else
	  	@comments = Comment.find(:all, :conditions => conditions)
	end

  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @comment_pages, @comments = paginate :comments, :per_page => 100
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = 'Comment was successfully updated.'
      redirect_to :action => 'show', :id => @comment
    else
      render :action => 'edit'
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
