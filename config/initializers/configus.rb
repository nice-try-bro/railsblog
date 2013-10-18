Configus.build Rails.env do
  env :production do
    user 'dhh'
    password 'secret'
  end

  env :development, :parent => :production do
  end

  #FIXME: should inherit from production but don't need credential parameters
  env :test
end
