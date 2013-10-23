require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  test "#index" do
    create_list :user, 5
    get :index
    assert_response :success
  end

  test "#new" do
    get :new
    assert_response :success
  end

  test "#create" do
    @user_attrs = attributes_for :user
    post :create, { :user => @user_attrs }
    assert_response :redirect
    @created_user = User.find_by(:login => @user_attrs[:login])
    assert { @created_user }
  end

  test "#show" do
    @user = create :user
    get :show, :id => @user.id
    assert_response :success
  end
end
