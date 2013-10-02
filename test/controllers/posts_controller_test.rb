require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "#new" do
    get :new
    assert_response :success
  end

  test "#create" do
    #TODO: use generators
    new_post = { :post => { title: 'Some Title', text: 'Some text' } }
    post :create, new_post
    assert_response :redirect
  end

  test "#update" do
    #TODO: move setting up parameters for post to setup
    #TODO: use special tools for generating data
    new_post = { :post => { title: 'Some Title', text: 'Some text' } }
    post :create, new_post
    same_post = Post.find_by(:title => 'Some Title')
    same_post.title = 'Some Other Title'
    put :update, :id => same_post.id, :post => same_post.attributes
    assert_response :redirect
    #FIXME: it uses and tests real model, which considered to be bad
    altered_post = Post.find_by(:title => 'Some Other Title')
    #FIXME: seems there should be one assertion per method
    assert altered_post
  end
end
