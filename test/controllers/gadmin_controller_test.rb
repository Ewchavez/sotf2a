require 'test_helper'

class GadminControllerTest < ActionDispatch::IntegrationTest



  test "desabilitar curso" do

  get "/gadmin/deshabilitar",
     params: { idc: 1}
   assert_response :success, "Se ha desabilitado el curso correctamente"
  end


  test "habilitar curso" do

  get "/gadmin/deshabilitar",
     params: { idc: 1}
   assert_response :success, "Se ha habilito el curso correctamente"
  end



  test "cambiar nombre curso" do

  get "/gadmin/cambiarnombre",

      params: { idc: 1,nombre: "nombre nuevo"}
   assert_response :success, "cambio de nombre correto"
  end
end
