require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  #FIXME: it should be owned by object creator
  def create_post_attributes
    attributes_for(:post)
  end

  test "#new" do
    get :new
    assert_response :success
  end

  test "#create" do
    new_post = create_post_attributes
    post :create, { post: new_post }
    assert_response :redirect
  end

  test "#update" do
    new_post = create :post
    old_title = new_post.title
    same_post = Post.find_by(:title => old_title)
    new_title = generate :title
    same_post.title = new_title
    put :update, :id => same_post.id, :post => same_post.attributes
    assert_response :redirect
    altered_post = Post.find_by(:title => new_title)
    assert altered_post
  end

  test "#show" do
    new_post = create :post
    get :show, :id => new_post.id
    assert_response :success
  end
end
