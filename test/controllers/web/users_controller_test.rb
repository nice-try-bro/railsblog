require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  test "#new" do
    get :new
    assert_response :success
  end
end
