class PostsController < ApplicationController

  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id]) 
  end

  def update
    @post = Post.find(params[:id])    
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
    if @post.save
      flash[:notice] = 'Create Post Successful'
      redirect_to posts_path
    else
      render :new
    end
  end
  
  private

  def post_params
    params.require(:post).permit(:title,:url,:description)
  end

end
