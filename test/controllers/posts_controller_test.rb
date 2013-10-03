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
    new_post = create_post_attributes
    post :create, { post: new_post }
    same_post = Post.find_by(:title => new_post[:title])
    new_title = 'Some Other Title'
    same_post.title = new_title
    put :update, :id => same_post.id, :post => same_post.attributes
    assert_response :redirect
    #FIXME: it uses and tests real model, which considered to be bad
    altered_post = Post.find_by(:title => new_title)
    #FIXME: seems there should be one assertion per method
    assert altered_post
  end
end
