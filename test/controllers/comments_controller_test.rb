require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test "#create" do
    new_post = create :post
    new_comment = new_post.comments.build(attributes_for :comment)
    post :create, :post_id => new_comment.post.id, :comment => new_comment.attributes
    assert_response :redirect
    created_comment = new_post.comments.find_by(:body => new_comment.body)
    assert created_comment
  end

  test "#destroy" do
    new_post = create :post
    new_comment = new_post.comments.create(attributes_for :comment)
    comment_id = new_comment.id
    delete :destroy, :post_id => new_comment.post.id, :id => new_comment.id
    assert_response :redirect
    #NOTE: new_comment object may be used instead of comment_id
    assert !new_post.comments.exists?(comment_id)
  end
end
