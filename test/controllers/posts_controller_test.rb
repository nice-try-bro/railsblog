require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "#new" do
    get :new
    assert_response :success
  end

  test "#index" do
    get :index
    assert_response :success
  end

  test "#create" do
    post_title = generate :title
    new_post = build :post, :title => post_title
    post :create, { :post => new_post.attributes }
    assert_response :redirect
    saved_post = Post.find_by_title(post_title)
    assert saved_post
  end

  test "#update" do
    new_post = create :post
    old_title = new_post.title
    same_post = Post.find_by_title(old_title)
    new_title = generate :title
    same_post.title = new_title
    put :update, :id => same_post.id, :post => same_post.attributes
    assert_response :redirect
    altered_post = Post.find_by_title(new_title)
    assert altered_post
  end

  test "#show" do
    new_post = create :post
    get :show, :id => new_post.id
    assert_response :success
  end

  #FIXME: extract common code from get methods tests
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
    deleted_post = Post.find_by(:id => post_id)
    refute deleted_post
  end
end
