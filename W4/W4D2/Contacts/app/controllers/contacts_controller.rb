class ContactsController < ApplicationController
  def index
    @contacts = Contact.contacts_for_user_id(params[:user_id])
    render :json => @contacts
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render :json => contact
    else
      render :json => contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @contact = Contact.find(params[:id])
    render :json => @contact
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update_attributes(contact_params)
      render :json => @contact
    else
      render :json => @contact.errors.full_messages
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.try(:destroy)

    render :json => {message: "#{@contact.name} was destroyed!"}
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :user_id, :email)
  end
end
