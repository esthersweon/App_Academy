class CatRentalRequestsController < ApplicationController
  def index
    @cat = Cat.find(params[:id])
    @rental_request = @cat.cat_rental_requests
    #
    # @rental_request = CatRentalRequest.cat_rental_requests_for_cats
    render :index
  end
  #
  # def show
  #   @cat = Cat.find(params[:id])
  #   render :show
  # end
  #
  # def new
  #   @cat = Cat.new
  #   render :new
  # end
  #
  # def create
  #   @cat = Cat.new(cat_params)
  #
  #   if @cat.save!
  #     redirect_to cat_url(@cat)
  #   else
  #     render :json => @cat.errors.full_messages
  #     # store messages in flash[:errors], re-render :new, show errors
  #   end
  # end
  #
  # def edit
  #   @cat = Cat.find(params[:id])
  #   render :edit
  # end
  #
  # def update
  #   @cat = Cat.find(params[:id])
  #
  #   if @cat.update_attributes(cat_params)
  #     redirect_to cat_url(@cat)
  #   else
  #     render :json => @cat.errors.full_messages
  #   end
  # end
  #
  # private
  #
  # def cat_params
  #   params.require(:cat).permit(:age, :birth_date, :color, :name, :sex)
  # end
end