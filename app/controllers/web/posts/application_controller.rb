class Web::Posts::ApplicationController < Web::ApplicationController
  #FIXME: doubles that in PostsController
  add_breadcrumb :posts, :posts_path
end
