class MailerJob < ActiveJob::Base
  queue_as :default

  def perform()
    ArticleMailer.welcome_email.deliver_now
  end
end
