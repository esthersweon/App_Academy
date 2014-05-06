class CirclesController < ApplicationController

  def new
    @circle = Circle.new
    @users = User.all
    render :new
  end

  def create
    @circle = current_user.circles.new(circle_params)

    # @circle = Circle.new(user_id: current_user.id)
    # fail
    if @circle.save
      # circle_params.each do |id|
      #   membership = CircleMembership.new(
      #     member_id: id.to_i,
      #     circle_id: @circle.id)
      #   membership.save
      # end
      redirect_to new_user_circle_url(current_user)
    else
      @users = User.all
      flash.now[:errors] = @circle.errors.full_messages
      render :new
    end

    # p circle_params
  #   p params
  #
  #   redirect_to new_circle_url
  end

  private

  def circle_params
    params.require(:circle).permit(:title, :member_ids => [])
  end
end
