class GadminController < ApplicationController


  def gusuario
    #@pp=Servicio.select("servicios.origen","servicios.destino","taxist_id","nombre","id").joins("join taxists on taxists.id=servicios.taxist_id").where(estado:1,finalizado:nil)
    @todos=Usuario.select("codigo","email","nombre","nivelu")
    @Facultad=Facultad.select("Nombre")
    @Carrera=Carrera.select("Nombre")
    @Semestre=Semestre.select("Fecha")
    @Seccion=Seccion.select("id")
    @Profesor=Usuario.select("nombre").where("nivelu":2)

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
