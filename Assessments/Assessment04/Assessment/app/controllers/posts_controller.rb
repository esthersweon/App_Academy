class PostsController < ApplicationController
	def index
		@posts = Post.all

		render :index
	end

	def new
		if signed_in?
			@post = Post.new
			render :new
		else
			require_signed_in
		end
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id

		if @post.save
			redirect_to post_url(@post)
		else
			flash[:errors] = @post.errors.full_messages
			render :new
		end
	end

	def show
		@post = Post.find(params[:id])
		render :show
	end

	def edit
		@post = Post.find(params[:id])
		render :edit
	end

	def update
		@post = Post.find(params[:id])
		
		if @post.update_attributes(post_params)
			redirect_to post_url(@post)
		else
			flash[:errors] = @post.errors.full_messages
			render :edit
		end
	end

	def destroy
		@post = Post.find(params[:id]).destroy
		redirect_to posts_url
	end

	private

	def post_params
		params.require(:post).permit(:title, :body, :user_id)
	end
end
