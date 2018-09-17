class AsesoriaGController < ApplicationController
  def alumnosa
  end

  def alumnosb
  end

  def profesoresa

  currenU=Usuario.find_by(codigo:session[:usuario])
  @idUsuario="Bienvenido #{currenU.codigo}"
  @todos=Seccion.select("idsec","id","cursos.nombre","capacidad").joins("join cursos on cursos.id=seccions.curso_id join profesors on seccions.profesor_id=profesors.id where profesors.usuario_id=#{currenU.id}")

  t = Time.now

  @horaactual=t.strftime("%Y").to_i

end
  def cursoselec

    profesoresa()
    @mensaje1 = true
      @mensaje2 = true
    gg=Seccion.find_by(idsec:params["cursoselecto"])
    @asesoria=Asesor.select("id","dia","lugar","horai","cursos.nombre").joins("join seccions on asesors.seccion_id=seccions.id join cursos on seccions.curso_id=cursos.id where seccions.idsec=#{gg.idsec} ")
    @curso="para el curso   #{gg.id}"
    vv=params["cursoselecto"]
    @idaseroriaaa=vv
    render 'profesoresa'
  end

  def   crearasesoria
    profesoresa()

    gg1=Profesor.find_by(usuario_id:session[:usuario])

    ll=Seccion.find_by(idsec:params["cursoesco"])
    ases=Asesor.new(seccion_id:ll.id,dia:params["calendario"],horai:params["hora"],lugar:params["lugar"])

    ases.save
    @asesoria=Asesor.select("id","dia","lugar","horai","cursos.nombre").joins("join seccions on asesors.seccion_id=seccions.id join cursos on seccions.curso_id=cursos.id where seccions.idsec=#{ll.idsec} ")

    @mensaje2 = true

    @kikoko="Se creo la asesoria para la sección #{ll.idsec}"

    render 'profesoresa'

  end

  def profesoresb
  end
end
