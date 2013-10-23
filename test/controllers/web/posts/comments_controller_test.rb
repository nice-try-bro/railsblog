require 'test_helper'

class Web::Posts::CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = create 'post/comment'
    @post = @comment.post
  end

  test "#new" do
    get :new, :post_id => @post.id, :parent_id => @comment.id
    assert_response :success
  end

  test "#destroy" do
    delete :destroy, :post_id => @post.id, :id => @comment.id
    assert_response :redirect
    assert { !@post.comments.exists?(@comment) }
  end
end
