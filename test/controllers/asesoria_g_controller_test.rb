require 'test_helper'

class AsesoriaGControllerTest < ActionDispatch::IntegrationTest

  test "Solicitar asesoria" do

  get "/asesoria_g/solicitarase",
     params: { cursoselec:1 }
   assert_response :success, "Se ha solicitado la asesoria"
  end


  test "Crear asesoria" do

  get "/asesoria_g/crearasesoria",
     params: {cursoesco:101,calendario:"otro", calendario2: "Lunes", horai:"16-18",lugar:"w-102"}
   assert_response :success, "Asesoria creada"
  end


end
