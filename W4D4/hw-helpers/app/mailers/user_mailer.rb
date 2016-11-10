class UserMailer < ActionMailer::Base
  default from: "mailer@99cats.com"

  def welcome_email(user)
    @url = 'http://www.google.com'
    mail(to: "#{user.username}@google.com", subject: "Hello world")
  end
end
