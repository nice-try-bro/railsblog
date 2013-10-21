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

  test "#create" do
    @comment_attrs = attributes_for 'post/comment'
    post :create, :post_id => @post.id, :post_comment => @comment_attrs
    assert_response :redirect
    @created_comment = @post.comments.find_by(:body => @comment_attrs[:body])
    assert { @created_comment }
  end

  test "#destroy" do
    delete :destroy, :post_id => @post.id, :id => @comment.id
    assert_response :redirect
    assert { !@post.comments.exists?(@comment) }
  end
end
