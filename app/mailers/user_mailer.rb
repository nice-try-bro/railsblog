class UserMailer < BaseMailer
  def registration_notice(user)
    @user = user
    @host = configus.mailer.host
    mail :to => @user.email
  end
end
