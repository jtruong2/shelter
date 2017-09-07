class UserMailer < ApplicationMailer
  default from: 'noreply@shelter.org'

 def welcome_email(user)
   @user = user
   @url = 'http://shelter-in-need.heroku.com/login'
   mail to: @user.email, subject: "Welcome, We're happy to have you with us"
 end
end
