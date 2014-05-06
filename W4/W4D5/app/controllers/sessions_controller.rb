class SessionsController < ApplicationController

	include SessionsHelper

	def new
		render :new
	end

	def create
		user = User.find_by_credentials(
			params[:user][:email], 
			params[:user][:password]
		)

		if user.nil?
			flash.now[:errors] ||= []
			flash.now[:notice] = "Login failed"
			render :new
		else
			login_user!(user)
			redirect_to user_url(user)
		end

	end

	def destroy
		user.reset_session_token!
		session[:session_token] = nil

		redirect_to new_session_url
	end

end
