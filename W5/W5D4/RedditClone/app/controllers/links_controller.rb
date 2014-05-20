class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @sub_id = params[:sub_id]
    @link = Link.new
  end

  def show
    @link = Link.find(params[:id])
    @sub = Sub.find(params[:sub_id])
    render :show
  end

  def create
    #    links/?sub_id=5
    @sub = Sub.find(params[:sub_id])
    @link = @sub.links.new(link_params)
    #fail
    if @sub.save
      # @sub.links << @link
      flash[:notice] = ["Successfully created link."]
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def edit
    @sub_id = params[:sub_id]
    @link = Link.find(params[:id])
    render :edit
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      flash[:notice] = ["Successfully updated link."]
      redirect_to sub_url(params[:sub_id])
    else
      flash.now[:errors] = @link.errors.full_messages
      render :edit
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    flash[:notice] = ["Successfully destroyed link."]
    redirect_to links_url
  end

  def add_link

  end

  private
  def link_params
    params.require(:link).permit(:title, :url, :text)
  end
end
