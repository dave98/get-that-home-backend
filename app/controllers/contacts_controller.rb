class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    render json: @contacts, status: :ok
  end

  def create
    # api create
    @contact = Contact.new(contact_params)
    if current_user && @contact.save
      render json: @contact, status: :created
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    if current_user != @contact.user
      render json: {errors: "You are not authorized to delete this message"}, status: :unauthorized
    else
    @contact.destroy
    render json: { message: "Message deleted" }, status: :ok
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:message, :user_id, :property_id)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def require_same_user
    if current_user != @contact.user
      render json: { message: "You are not authorized to perform this action" }, status: :unauthorize
    end
  end
end
