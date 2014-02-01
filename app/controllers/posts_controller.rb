class PostsController < ApplicationController
  before_action :require_user, only: [:new, :create, :edit]
  before_action :set_post, only: [:show, :edit, :update, :vote]
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

  private

  def post_params
    params.require(:post).permit(:title,:url,:description)
  end

end
