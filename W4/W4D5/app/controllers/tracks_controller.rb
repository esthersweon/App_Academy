class TracksController < ApplicationController
	def index
		@tracks = Track.all
		render :index
	end

	def show
		@track = Track.find(params[:id])
		render: show
	end

	def new
		@track = Track.new
		render :new
	end

	def create
		@track = Track.new(track_params)

		if @track.save
			flash[:notice] = "Saved track!"
			redirect_to track_url
		else
			flash.now[:errors] = @track.errors.full_messages
			render :new 
		end
	end

	def edit
		@track = Track.find(params[:id])
		render :edit
	end
	
	def update
		@track = Track.find(params[:id])

		if @track.update_attributes(track_params)
			redirect_to track_url(@track)
		else
			render :edit
		end
	end
	
	def destroy
		@track = Track.find(params[:id])
		@track.destroy
	end

	private

	def track_params
		params.require("track").permit(:name, :album_id, :ord, :bonus, :lyrics)
	end

end
