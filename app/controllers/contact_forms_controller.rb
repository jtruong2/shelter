class ContactFormsController < ApplicationController
  def new
    @contact_form = ContactForm.new
  end

  def create
    ContactForm.send_message(safe_params)
    flash[:notice] = "Thank you for your response, We'll get back to you shortly"
    redirect_to new_contact_form_path
  end

  private

  def safe_params
    params.permit(:name, :email, :message)
  end

end
