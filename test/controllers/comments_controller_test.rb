require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test "#create" do
    new_post = create :post
    post_id = new_post.id
    new_comment = build :comment
    #FIXME: implement without overriding associated post
    post :create, { :post_id => post_id, :comment => new_comment.attributes }
    assert_response :redirect
    assert Comment.exists?(:post_id => post_id)
  end

  test "#destroy" do
    new_comment = create :comment
    comment_id = new_comment.id
    delete :destroy, { :post_id => new_comment.post_id, :id => comment_id }
    assert_response :redirect
    assert !Comment.exists?(comment_id)
  end
end
