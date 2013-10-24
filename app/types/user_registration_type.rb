class UserRegistrationType < User
  include BaseType

  has_secure_password
end
