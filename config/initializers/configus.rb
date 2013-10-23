Configus.build Rails.env do
  #NOTE: may be not convenient
  env :shared do
    mailer do
      from 'noreply@mighty-gorge-8937.com'
      host 'mighty-gorge-8937.herokuapp.com'
    end
  end

  env :production, :parent => :shared do
    user 'dhh'
    password 'secret'
  end

  env :development, :parent => :production

  env :test, :parent => :shared
end
