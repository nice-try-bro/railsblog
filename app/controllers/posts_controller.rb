class PostsController < ApplicationController
  def new

  end

  def create
    render text: params.each.map(&:inspect).join("\n")
  end
end
