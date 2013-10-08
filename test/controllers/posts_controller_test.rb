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
    post_text = new_post.text
    post :create, :post => new_post.attributes
    assert_response :redirect
    created_post = Post.find_by(:text => post_text)
    assert_equal post_text, created_post.text
  end

  test "#update" do
    new_post = create :post
    new_title = generate :title
    new_post.title = new_title
    put :update, :id => new_post.id, :post => new_post.attributes
    assert_response :redirect
    updated_post = new_post.reload
    assert_equal new_title, new_post.title
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
    delete :destroy, :id => post_id
    assert_response :redirect
    assert !Post.exists?(:id => post_id)
  end
end
