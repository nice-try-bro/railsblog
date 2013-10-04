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
end
