# frozen_string_literal: true

# Contact Controller
class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to thank_you_page_path
    else
      redirect_back(fallback_location: contact_us_page_path)
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :comment)
  end
end
