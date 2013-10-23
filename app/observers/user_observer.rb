class UserObserver < ActiveRecord::Observer
  def after_commit(user)
    UserMailer.registration_notice(user).deliver if created?(user)
  end

private
  #FIXME: it's a hack
  def created?(user)
    user.previous_changes.has_key?(:id)
  end
end
