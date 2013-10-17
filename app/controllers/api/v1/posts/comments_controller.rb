class Api::V1::Posts::CommentsController < Api::V1::Posts::ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.save
    respond_with(@post, @comment, :location => nil)
  end

:private
  def comment_params
    params.require(:post_comment).permit(:commenter, :body)
  end
end
