class GadminController < ApplicationController


  def gusuario
    @todos=Usuario.select("codigo","email","nombre","nivelu")
  end

  def  asignar

    currenU=Usuario.find_by(codigo:session[:usuarioO])
    @idUsuario=currenU.nickname
    ser=Usuario.find_by(id:params["idser"])
    ser.nivelu=params["nivelu"]
    ser.email=params["email"]
    ser.codigo=params["codigo"]
    ser.save



  end



  def gfacultad
  end

  def gasesorias
  end

  def getc
  end
end
