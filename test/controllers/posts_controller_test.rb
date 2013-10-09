require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "#new" do
    get :new
    assert_response :success
  end

  test "#index" do
    create :post
    get :index
    assert_response :success
  end

  test "#create" do
    new_post = build :post
    post :create, :post => new_post.attributes
    assert_response :redirect
    created_post = Post.find_by(:text => new_post.text)
    assert_equal new_post.text, created_post.text
  end

  test "#update" do
    new_post = create :post
    new_text = generate :text
    new_post.text = new_text
    put :update, :id => new_post.id, :post => new_post.attributes
    assert_response :redirect
    new_post.reload
    assert_equal new_text, new_post.text
  end

  test "#show" do
    new_post = create :post
    get :show, :id => new_post.id
    assert_response :success
  end

  test "#edit" do
    new_post = create :post
    get :edit, :id => new_post.id
    assert_response :success
  end

  test "#destroy" do
    new_post = create :post
    post_id = new_post.id
    delete :destroy, :id => new_post.id
    assert_response :redirect
    Rails.logger.debug "Deleted post: #{new_post}"
    #NOTE: new_post object may be used instead of post_id
    assert !Post.exists?(post_id)
  end
end
