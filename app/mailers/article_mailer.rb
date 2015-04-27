class ArticleMailer < ApplicationMailer
  def welcome_email()
    mail(to: "tuannd@nustechnology.com", subject: "Welcome")
  end
end
