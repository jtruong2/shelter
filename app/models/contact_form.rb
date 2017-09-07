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

  def self.send_message(content)
    new(name: content[:name], email: content[:email], message: content[:message]).deliver
  end
end
