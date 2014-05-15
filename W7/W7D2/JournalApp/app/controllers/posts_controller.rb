class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    @post.save!
    
    render json: @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    render json: nil
  end

  def index
    @posts = Post.all

    render json: @posts 
  end

  def show
    @posts = Post.find(params[:id])
    render json: @post
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    render json: @post
  end

  private 
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
