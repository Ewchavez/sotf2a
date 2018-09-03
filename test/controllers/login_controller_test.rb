require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get inicio" do
    get login_inicio_url
    assert_response :success
  end

end
