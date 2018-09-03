require 'test_helper'

class AsesoriaGControllerTest < ActionDispatch::IntegrationTest
  test "should get alumnosa" do
    get asesoria_g_alumnosa_url
    assert_response :success
  end

  test "should get alumnosb" do
    get asesoria_g_alumnosb_url
    assert_response :success
  end

  test "should get profesoresa" do
    get asesoria_g_profesoresa_url
    assert_response :success
  end

  test "should get profesoresb" do
    get asesoria_g_profesoresb_url
    assert_response :success
  end

end
