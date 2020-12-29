class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.gmail[:from]
  layout 'mailer'
end
