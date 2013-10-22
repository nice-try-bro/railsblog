require 'test_helper'

class Web::PostsControllerTest < ActionController::TestCase
  setup do
    @post = create :post
  end

  test "#new" do
    get :new
    assert_response :success
  end

  test "#index" do
    get :index
    assert_response :success
  end

  test "#create" do
    @post_attrs = attributes_for :post
    post :create, :post => @post_attrs
    assert_response :redirect
    @created_post = Post.find_by(:text => @post_attrs[:text])
    assert { @created_post }
  end

  test "#update" do
    @new_text = generate :text
    put :update, :id => @post.id, :post => {:text => @new_text}
    assert_response :redirect
    @post.reload
    assert { @new_text == @post.text }
  end

  test "#show" do
    get :show, :id => @post.id
    assert_response :success
  end

  test "#edit" do
    get :edit, :id => @post.id
    assert_response :success
  end

  test "#destroy" do
    delete :destroy, :id => @post.id
    assert_response :redirect
    assert { !Post.exists?(@post) }
  end
end
