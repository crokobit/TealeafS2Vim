class PostsController < ApplicationController
  before_action :require_user, only: [:new, :create, :edit]
  before_action :set_post, only: [:show, :edit, :update, :vote]
  before_action :require_creator, only: [:edit, :update]
  def index
    @posts = Post.all
  end
  
  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Update Post success'
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params) 
    @post.creator = current_user
    if @post.save
      flash[:notice] = 'Create Post Successful'
      redirect_to posts_path
    else
      render :new
    end
  end

  def vote
    @vote = Vote.create(vote: params[:vote], creator: current_user, voteable: @post)
    
    respond_to do |format|

      format.html do
        if vote.valid?
          flash[:notice] = 'Vote Success'
        else
          flash[:error] = 'Only onece'
        end
        redirect_to :back
      end

      format.js

    end
  end

  def set_post
    @post = Post.find_by(slug: params[:id])    
  end

  def require_creator
    access_denied unless @post.creator == current_user 
  end
  private

  def post_params
    params.require(:post).permit(:title,:url,:description)
  end

end
