class Api::V1::Posts::CommentsController < Api::V1::Posts::ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    respond_with(@comments)
  end

  def new
    @post = Post.find(params[:post_id])
    @parent_comment = @post.comments.find(params[:parent_id])
    @comment = @post.comments.build(:parent_id => @parent_comment.id)

    respond_with(@comment)
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
