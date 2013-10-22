class Api::V1::Posts::CommentsController < Api::V1::Posts::ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    respond_with(@comments)
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    respond_with(@post, @comment, :location => nil)
  end

:private
  def comment_params
    params.require(:post_comment).permit(:commenter, :body, :parent_id)
  end
end
