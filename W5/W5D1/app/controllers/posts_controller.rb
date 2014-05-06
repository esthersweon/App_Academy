class PostsController < ApplicationController
  def new
    @post = Post.new
    @circles = Circle.where(user_id: current_user.id)
    render :new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
    else
      flash.now[:error]=
    end
    p @post
    redirect_to new_user_post_url
  end

  def post_params
    params.require(:post).permit(:body, :circle_ids => [])
  end
end
