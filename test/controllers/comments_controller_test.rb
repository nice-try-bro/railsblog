require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test "#create" do
    new_post = create :post
    post_id = new_post.id
    new_comment = build :comment
    #FIXME: implement without overriding associated post
    post :create, { :post_id => post_id, :comment => new_comment.attributes }
    assert_response :redirect
    saved_comment = Comment.find_by_post_id(post_id)
    assert saved_comment
  end

  test "#destroy" do
    new_comment = create :comment
    post_id = new_comment.post_id
    comment_id = new_comment.id
    delete :destroy, { :post_id => post_id, :id => comment_id }
    assert_response :redirect
    deleted_comment = Comment.find_by_id(comment_id)
    refute deleted_comment
  end
end
