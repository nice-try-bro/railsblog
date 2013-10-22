class BaseMailer < ActionMailer::Base
  default :from => configus.mailer.from
  default_url_options[:host] = configus.mailer.host
end
