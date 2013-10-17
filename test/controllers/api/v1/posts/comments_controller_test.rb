require 'test_helper'

class Api::V1::Posts::CommentsControllerTest < ActionController::TestCase
  test "#index" do
    @post = create :post
    get :index, :post_id => @post.id, :format => :json
    assert_response :success
  end

  test "#create" do
    @post = create :post
    @comment_attrs = attributes_for 'post/comment'
    @params = { :post_id => @post.id, :format => :json }
    post :create, @params.merge(:post_comment => @comment_attrs)
    assert_response :created
    @created_comment = @post.comments.find_by(:body => @comment_attrs[:body])
    assert @created_comment
  end
end
