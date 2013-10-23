Configus.build Rails.env do
  #NOTE: may be not convenient
  env :shared do
    mailer do
      from 'noreply@mighty-gorge-8937.com'
      host 'mighty-gorge-8937.herokuapp.com'
    end

    paging do
      post do
        #FIXME: cannot be omitted
        per_page 10
        attrs do
          window 3
          left 4
          right 4
        end
      end

      user do
        #FIXME: cannot be omitted
        per_page 10
      end
    end
  end

  env :production, :parent => :shared do
    user 'dhh'
    password 'secret'
  end

  env :development, :parent => :production

  env :test, :parent => :shared
end
