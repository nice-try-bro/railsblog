require 'test_helper'

class Api::V1::Posts::CommentsControllerTest < ActionController::TestCase
  def setup
    @post = create :post
    @params = { :post_id => @post.id, :format => :json }
  end

  test "#index" do
    get :index, @params
    assert_response :success
  end

  test "#create" do
    @comment_attrs = attributes_for 'post/comment'
    post :create, @params.merge(:post_comment => @comment_attrs)
    assert_response :created
    @created_comment = @post.comments.find_by(:body => @comment_attrs[:body])
    assert @created_comment
  end
end
