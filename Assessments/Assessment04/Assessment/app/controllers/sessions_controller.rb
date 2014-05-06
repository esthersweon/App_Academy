class SessionsController < ApplicationController
	def new
		render :new
	end

	def create
		@user = User.find_by_creds(
			params[:user][:username],
			params[:user][:password])

		if @user
			sign_in(@user)
			redirect_to posts_url
		else
			flash[:errors] = ["Invalid user/password."]
			redirect_to new_session_url
		end
	end

	def destroy
		sign_out
		redirect_to new_session_url
	end

end
