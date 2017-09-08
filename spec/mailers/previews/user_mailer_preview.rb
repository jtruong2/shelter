# Preview all emails at http://localhost:3000/rails/mailers/notifier
class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    UserMailer.welcome_email(User.first)
  end
end
