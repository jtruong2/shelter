class ContactForm < MailForm::Base
  attribute :name,     validates: true
  attribute :email,    validates: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message

  def headers
    {
      to: ENV["GMAIL"],
      from: %("#{name}" <#{email}>)
    }
  end
end
