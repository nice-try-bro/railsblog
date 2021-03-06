class Web::Posts::CommentsController < Web::Posts::ApplicationController

  unless Rails.env.test?
    http_basic_authenticate_with :name => configus.user, :password => configus.password,
                                 :only => :destroy
  end

  def new
    @post = Post.find(params[:post_id])
    @parent_comment = @post.comments.find(params[:parent_id])
    @comment = @post.comments.build(:parent_id => @parent_comment.id)

    add_breadcrumb :new_comment
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:post_comment).permit(:commenter, :body, :parent_id)
  end
end
