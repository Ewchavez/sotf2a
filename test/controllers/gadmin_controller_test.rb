require 'test_helper'

class GadminControllerTest < ActionDispatch::IntegrationTest
  test "should get gusuario" do
    get gadmin_gusuario_url
    assert_response :success
  end

  test "should get gfacultad" do
    get gadmin_gfacultad_url
    assert_response :success
  end

  test "should get gasesorias" do
    get gadmin_gasesorias_url
    assert_response :success
  end

  test "should get getc" do
    get gadmin_getc_url
    assert_response :success
  end

end
