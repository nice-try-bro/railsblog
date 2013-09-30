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
end