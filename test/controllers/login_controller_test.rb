require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "Login usuario" do

  post "/login/verificar",
     params: { codigo: 1111,contrasena:"holagg"}
   assert_response :success , "Fallo el logeo"
  end
end
