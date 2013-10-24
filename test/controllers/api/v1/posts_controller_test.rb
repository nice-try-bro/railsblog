class Api::V1::PostsControllerTest < ActionController::TestCase
  setup do
    create_list :post, 3
    @post = create :post
      @params = { :format => :json }
  end

  test "#index" do
    get :index, @params
    assert_response :success
  end

  test "show" do
    @post.publish
    get :show, @params.merge(:id => @post.id)
    assert_response :success
  end
end
