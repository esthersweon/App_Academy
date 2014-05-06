class TagsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@tag = @post.tags.new(tag_params)

		if @tag.save
			redirect_to post_url(@post)
		else
			redirect_to post_url(@post)
		end
	end

	def destroy
		tag = Tag.find(params[:id])
		tag.destroy
		redirect_to post_url(tag.post_id)
	end

	private

	def tag_params
		params.require(:tag).permit(:name, :post_id)
	end
end
