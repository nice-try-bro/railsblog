class Api::V1::PostsControllerTest < ActionController::TestCase
  setup do
    create_list :post, 3
    @params = { :format => :json }
  end

  test "#index" do
    get :index, @params
    assert_response :success
  end
end
