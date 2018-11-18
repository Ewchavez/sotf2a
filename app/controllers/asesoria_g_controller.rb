class AsesoriaGController < ApplicationController
  def alumnosa
    currenU=Usuario.find_by(codigo:session[:usuario])
    alum=Alumno.find_by(usuario_id:currenU.id)
    @idUsuario="Bienvenido #{currenU.codigo}"
  #  @asesoria=Asesor.select("id","dia","lugar","horai","cursos.nombre").joins("join seccions on asesors.seccion_id=seccions.id join cursos on seccions.curso_id=cursos.id ")
    @carrera=Carrera.select("id","nombre")
  #  @cursot=Curso.select("nombre","id")
  #  @Profesor=Usuario.select("usuarios.nombre","profesors.id","usuario_id").joins("join profesors on profesors.usuario_id=usuarios.id").where("nivelu":2)
  for i in Asesor.where("fecha < ?", Time.now)

     i.disponibilidada=0
     i.save
   end
  end
  def chat
      currenU=Usuario.find_by(codigo:session[:usuario])
        alumnosa()
        @user_id=currenU.codigo
        @amigos =Usuario.where.not( nombre:currenU.nombre)
        if currenU.nivelu==1

          @direccion=1

        elsif currenU.nivelu==2
          @direccion=2


        elsif currenU.nivelu==3
          @direccion=3


        elsif currenU.nivelu==nil
          @direccion=4







         end


    end
    def comunicar
      currenU=Usuario.find_by(codigo:session[:usuario])
      chat()
      amigo=params["amigo"]
      amigoc=Usuario.find_by(codigo:amigo)


      @mensaje2=amigoc.nombre
      @destino_id=amigoc.codigo



            if  Chat.find_by(origen: currenU.codigo  , destino:amigoc.codigo)==nil and Chat.find_by(origen: amigoc.codigo  , destino:currenU.codigo)==nil
              nuevo=Chat.create(origen: currenU.codigo  , destino:amigoc.codigo)
              nuevo.save
              buscara=Chat.find_by(origen: currenU.codigo  , destino:amigoc.codigo)
              @room_id=buscara.id
            else
              buscara=Chat.find_by(origen: currenU.codigo  , destino:amigoc.codigo)
              if buscara==nil
              buscara=Chat.find_by(origen: amigoc.codigo  , destino:currenU.codigo)
              @room_id=buscara.id
              else

              @room_id=buscara.id


              end




            end

     @chatacti=true


     render 'chat'
    end



  def estado_reporte

    currenU=Usuario.find_by(codigo:session[:usuario])
    profe=Profesor.find_by(usuario_id:currenU.id)


    @all=Usuario.select("usuarios.nombre, citars.tema,citars.reporte,citars.fecha,citars.resumen").joins("join alumnos on usuarios.id=alumnos.usuario_id join citars on citars.alumno_id=alumnos.id where citars.profesorid=#{profe.id}")
    respond_to do |format|
      format.html
      format.json
      format.pdf {render template:'asesoria_g/reporte',pdf:'Reporte',layout:'pdf.html'}
    end

  end
  def buscador
    alumnosa()
    @dsds=true
    palabra= "%#{params[:keyboard]}%"
    palbra2=2
    @resultados=Usuario.select("usuarios.nombre","profesors.id","usuario_id").joins("join profesors on profesors.usuario_id=usuarios.id  join seccions on  seccions.profesor_id=profesors.id    ").where("lower(nombre) LIKE ?",palabra.downcase )




    render 'alumnosa'
  end
  def alumnosb
    alumnosa()
    currenU=Usuario.find_by(codigo:session[:usuario])
    alum=Alumno.find_by(usuario_id:currenU.id)
     @citas=Citar.select("asesors.lugar,citars.fecha as fc,citars.id,cursos.nombre").joins("join asesors on citars.asesor_id=asesors.id join seccions on asesors.seccion_id=seccions.id join cursos on cursos.id=seccions.curso_id where citars.alumno_id=#{alum.id} ")

  end

  def vercita
    alumnosb()
    @citamensaje=true
    cita=params["citaselecto"]

    gg=Citar.find_by(id:cita)

    @asesorias=gg.id
    @fecha=gg.fecha
    if gg.tema==nil
         @tema1=true
          @mensajep=  "En proceso"
    else
         @tema2=true
@mensajep="Cita confirmada"
@resumen=gg.resumen
      @temaCita=gg.tema
    end






    render 'alumnosb'
  end
  def eliminaraseso
    alumnosb()
    cita=params["asesorias"]
    gg=Citar.find_by(id:cita)
    gg.destroy

    render 'alumnosb'


  end

  def asignartema
    alumnosb()

    @citamensaje=true

    gg=Citar.find_by(id:params["idasesoria"])
    gg.tema=params["temap"]
    gg.resumen=params["resumen"]

    gg.save
    @resumen=gg.resumen
    @asesorias=gg.id
    @fecha=gg.fecha
    if gg.tema==nil
         @tema1=true
    else
         @tema2=true

      @temaCita=gg.tema
      @mensajep="Acaba de confirmar la cita"
    end
    render 'alumnosb'






  end
  def eliminarasesoriaprof
    profesoresa()
    cita=params["asesorias"]
    ase=params["asesorias"]
    cita=Citar.find_by(asesor_id:cita)
    if cita==nil
    else
        Citar.find_each do |cita|
          cita.asesor_id=nil
          cita.save
        end

    end

    gg=Asesor.find_by(id:ase.to_i)
    gg.destroy
    render 'profesoresa'

  end
  def controlasesori
    for i in Asesor.where("fecha < ?", Time.now)
       a=Asesor.find_by("fecha < ?", Time.now)

       a.disponibilidada=0
       a.save
     end
  end
  def profesoresa


  currenU=Usuario.find_by(codigo:session[:usuario])
  profe=Profesor.find_by(usuario_id:currenU.id)
  @idUsuario="Bienvenido #{currenU.codigo}"
  @todos=Seccion.select("idsec","id","cursos.nombre","capacidad").joins("join cursos on cursos.id=seccions.curso_id join profesors on seccions.profesor_id=profesors.id where profesors.usuario_id=#{currenU.id}")
  @Citasco=Citar.where(asesor_id: 7).count
  @citasxaten= Citar.select("cursos.nombre,asesors.id,seccions.idsec,count(citars.asesor_id) as d").joins("join asesors on citars.asesor_id=asesors.id join seccions on asesors.seccion_id=seccions.id join cursos on cursos.id=seccions.curso_id where seccions.profesor_id=#{profe.id}").group("citars.asesor_id,cursos.nombre,seccions.idsec,asesors.id").distinct
  @dispo=profe.estado
  t = Time.now

  @horaactual=t.strftime("%Y").to_i

  for i in Asesor.where("fecha < ?", Time.now)

     i.disponibilidada=0
     i.save
   end

end

def deshabilitarp
  profesoresa()
  currenU=Usuario.find_by(codigo:session[:usuario])
  profe=Profesor.find_by(usuario_id:currenU.id)
  profe.estado=1
  profe.save


  render 'profesoresa'
end


def habilitarp

  profesoresa()
  currenU=Usuario.find_by(codigo:session[:usuario])
  profe=Profesor.find_by(usuario_id:currenU.id)
  profe.estado=0
  profe.save
  render 'profesoresa'
end
  def cursopselec

    profesoresa()

    @mensaje1 = true
    @mensaje2 = true
    gg=Seccion.find_by(idsec:params["cursoselecto"])
    @asesoria=Asesor.select("id","ubicacion","fecha","lugar","idsec", "horai","cursos.nombre").joins("join seccions on asesors.seccion_id=seccions.id join cursos on seccions.curso_id=cursos.id where seccions.idsec=#{gg.idsec} and asesors.disponibilidada=1 " )
    @curso="para el curso   #{gg.id}"
    vv=params["cursoselecto"]
    @idaseroriaaa=vv
    for i in Asesor.where("fecha < ?", Time.now)

       i.disponibilidada=0
       i.save
     end
    render 'profesoresa'
  end

  def   crearasesoria
    profesoresa()

    gg1=Profesor.find_by(usuario_id:session[:usuario])

    ll=Seccion.find_by(idsec:params["cursoesco"])
    modo=params["calendario"]
    if  modo=="otro"

      if params["calendario2"]==""

        @kikoko="Error, Seleccione fecha exacta"

      else
          ases=Asesor.new(seccion_id:ll.id,fecha:params["calendario2"],horai:params["hora"],lugar:params["lugar"],disponibilidada:1)

          ases.save
          @kikoko="Correcto, asesoria creada hasta el dia #{params["calendario2"]}"

      end

  else

    ases=Asesor.new(seccion_id:ll.id,ubicacion:params["calendario"],horai:params["hora"],lugar:params["lugar"],disponibilidada:1)

    ases.save
    @kikoko="Correcto, asesoria creada hasta fin de ciclo"



  end
    @asesoria=Asesor.select("id","fecha","ubicacion","lugar","horai","cursos.nombre").joins("join seccions on asesors.seccion_id=seccions.id join cursos on seccions.curso_id=cursos.id where seccions.idsec=#{ll.idsec} and asesors.disponibilidada=1 ")

    @mensaje2 = true
    for i in Asesor.where("fecha < ?", Time.now)

       i.disponibilidada=0
       i.save
     end

    render 'profesoresa'

  end




def asesoriasshow(ll)
  @asesoria=Asesor.select("id","fecha","idsec","dia","lugar","ubicacion","horai","cursos.nombre").joins("join seccions on asesors.seccion_id=seccions.id join cursos on seccions.curso_id=cursos.id join carrxcurs  on  cursos.id=carrxcurs.idcurso where carrxcurs.idcarrera=#{ll} and asesors.disponibilidada=1")

end


def carreraelecta
  alumnosa()
  @asesoria1=true
  ll=params["carrera"]
  @filacarrera=ll
  asesoriasshow(ll)
  @busquedacursos=true
  @cursot=Curso.select("id","nombre").joins(" join carrxcurs  on  cursos.id=carrxcurs.idcurso where carrxcurs.idcarrera=#{ll}")
  @Profesor=Usuario.select("usuarios.nombre,profesors.id,seccions.idsec").joins("join profesors on profesors.usuario_id=usuarios.id  join seccions on  seccions.profesor_id=profesors.id join cursos on seccions.curso_id=cursos.id join carrxcurs  on  cursos.id=carrxcurs.idcurso    ").where("nivelu":2, "carrxcurs.idcarrera":ll).distinct("usuarios.nombre ")

  @busquedaprofesores=true


  render 'alumnosa'



end


def cursoselec
  alumnosa()
  @asesoria2=true
  ll=params["cursoelec"]
  gg=params["idcarrera"]
  @filacursosec=ll
  @filacarrera=gg
  @asesoria=Asesor.select("id","fecha","idsec","dia","lugar","ubicacion","horai","cursos.nombre").joins("join seccions on asesors.seccion_id=seccions.id join cursos on seccions.curso_id=cursos.id where seccions.curso_id=#{ll} and asesors.disponibilidada=1")
  @busquedacursos=true
  @cursot=Curso.select("id","nombre").joins(" join carrxcurs  on  cursos.id=carrxcurs.idcurso where carrxcurs.idcarrera=#{gg}")
  @busquedaprofesores=true

  @Profesor=Usuario.select("usuarios.nombre","profesors.id","seccions.idsec","usuario_id").joins("join profesors on profesors.usuario_id=usuarios.id  join seccions on  seccions.profesor_id=profesors.id    ").where("nivelu":2,"seccions.curso_id":ll)


 render 'alumnosa'



end








def profeselec

  alumnosa()
  @asesoria3=true
  idpro=params["profselec"]
  ww=params["idcursosec"]
  gg=params["idcarrera"]
  @filacursosec=ww
  @filacarrera=gg
  @asesoria=Asesor.select("id","fecha","idsec","dia","lugar","ubicacion","horai","cursos.nombre").joins("join seccions on asesors.seccion_id=seccions.id join cursos on seccions.curso_id=cursos.id where seccions.profesor_id=#{idpro}   and seccions.curso_id=#{ww} and asesors.disponibilidada=1")

  @busquedacursos=true
  @cursot=Curso.select("id","nombre").joins(" join carrxcurs  on  cursos.id=carrxcurs.idcurso where carrxcurs.idcarrera=#{gg}")
  @busquedaprofesores=true

  @Profesor=Usuario.select("usuarios.nombre","idsec","profesors.id","usuario_id").joins("join profesors on profesors.usuario_id=usuarios.id  join seccions on  seccions.profesor_id=profesors.id    ").where("nivelu":2,"seccions.curso_id":ww)


render 'alumnosa'


end
def solicitarase
  alumnosa()
  dd=params["cursoselecto"]
  go=Asesor.find_by(id:dd)
  currenU=Usuario.find_by(codigo:session[:usuario])
  jj=Seccion.find_by(id:go.seccion_id)
  alumno=Alumno.find_by(usuario_id:currenU.id)

  secc=Citar.new(alumno_id:alumno.id,asesor_id:dd,fecha:go.fecha,profesorid:jj.profesor_id)
  secc.save

  redirect_to('/asesoria_g/alumnosb')



end


def profesoresb
  bb=params["asesoria"]
  currenU=Usuario.find_by(codigo:session[:usuario])
  profe=Profesor.find_by(usuario_id:currenU.id)
  @citas=Citar.select("citars.tema,citars.id as cid,seccions.idsec,usuarios.codigo,cursos.nombre as c,asesors.id,seccions.idsec,usuarios.nombre as u").joins("join asesors on citars.asesor_id=asesors.id join seccions on asesors.seccion_id=seccions.id join cursos on cursos.id=seccions.curso_id join alumnos on  citars.alumno_id=alumnos.id join usuarios on usuarios.id=alumnos.usuario_id where seccions.profesor_id=#{profe.id}")



end
def gcita
  profesoresb()
  aa=params["citaselecto"]
  @citamensaje=true
  dd=Citar.find_by(id:aa)
  @citaid=dd.id
  @resumen=dd.resumen
  @temaCita=dd.tema
  @fecha=dd.fecha.to_formatted_s(:short)
  @reporte=dd.reporte

render 'profesoresb'



end

def realizareport
  profesoresb()
  aa=params["temap"]
  bb=params["reporte"]
  dd=Citar.find_by(id:params["idasesoria"])
  dd.tema=aa
  dd.reporte=bb
  dd.save
  @reporte=dd.reporte

  render 'profesoresb'

end
end
