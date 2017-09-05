class NotifierMailer < ApplicationMailer
  default from: 'no-reply@shelter.org'

  def welcome(user)
    @account = user
    mail(to: user.email) do |format|
      
  end
end
