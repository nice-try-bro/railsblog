require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test "#create" do
    new_post = create :post
    new_comment = build :comment, :post => new_post
    comment_body = new_comment.body
    post :create, :post_id => new_comment.post_id, :comment => new_comment.attributes
    assert_response :redirect
    created_comment = Comment.find_by(:body => comment_body)
    assert created_comment
  end

  test "#destroy" do
    new_comment = create :comment
    comment_id = new_comment.id
    delete :destroy, { :post_id => new_comment.post_id, :id => comment_id }
    assert_response :redirect
    assert !Comment.exists?(comment_id)
  end
end
