require 'test_helper'

class NewsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should get show" do
    get :show
    assert_response :success
  end
end
