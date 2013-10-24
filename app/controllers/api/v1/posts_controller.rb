class Api::V1::PostsController < Api::V1::ApplicationController
  def index
    @posts = Post.published
  end
end
