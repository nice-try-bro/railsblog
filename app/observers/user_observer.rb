class UserObserver < ActiveRecord::Observer
  def after_create(user)
    UserMailer.registration_notice(user).deliver
  end
end
