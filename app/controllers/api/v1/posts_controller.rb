class Api::V1::PostsController < Api::V1::ApplicationController
  def index
    @posts = Post.published
  end

  def show
    @post = Post.published.find(params[:id])
  end
end
