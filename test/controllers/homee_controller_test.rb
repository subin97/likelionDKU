require 'test_helper'

class HomeeControllerTest < ActionController::TestCase
  test "should get indexx" do
    get :indexx
    assert_response :success
  end

end
