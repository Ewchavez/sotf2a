class GadminController < ApplicationController

  class Conec
    UsurioN="sdasd"
  end


  def gusuario
    #@pp=Servicio.select("servicios.origen","servicios.destino","taxist_id","nombre","id").joins("join taxists on taxists.id=servicios.taxist_id").where(estado:1,finalizado:nil)
    @todos=Usuario.select("id","codigo","email","nombre","nivelu","contrasena","activo").where(activo:1)
    @todos2=Usuario.select("id","codigo","email","nombre","nivelu","contrasena","activo").where(activo:nil)
    @Facultad=Facultad.select("Nombre","id")
    @Carrera=Carrera.select("Nombre","id")
    @Semestre=Semestre.select("Fecha","id")
    @Seccion=Seccion.select("idsec","id").where("estado":nil)
    @SeccionD=Seccion.select("idsec","id","cursos.nombre").joins("join cursos on cursos.id=seccions.curso_id").where("estado":0)
    @Profesor=Usuario.select("usuarios.nombre","profesors.id","usuario_id").joins("join profesors on profesors.usuario_id=usuarios.id").where("nivelu":2)

    @Curso=Curso.select("nombre","id").where(nivelusuario:1)

    currenU=Usuario.find_by(codigo:session[:usuario])

    @idTaxiUser=currenU.codigo
  end

  def opcionesavanzad
    gusuario()
  end

  def  asignarU
      gusuario()

    ser=Usuario.find_by(id:params["idser"])
    ad=params["nivelu"]
    rr=params["tipof"]

    if rr=="1"
      ser.nombre=params["nick"]

    elsif  rr=="2"


      ser.nombre=params["nombre"]
      ser.activo=1
      ser.email=params["email"]
      ser.codigo=params["codigo"]


    end



    buscarA=Alumno.find_by(usuario_id:params["idser"])
    buscarP=Profesor.find_by(usuario_id:params["idser"])
    buscarAdmin=Administrador.find_by(usuario_id:params["idser"])

    buscarPS=Seccion.find_by(profesor_id:params["idser"])


    if buscarA==nil and buscarP==nil and buscarAdmin==nil
              if ad.to_i==2
                car=Profesor.new(usuario_id:ser.id)
                car.save
                @kikoko="Correctamente agregado"
                ser.nivelu=params["nivelu"]
              elsif  ad.to_i==1
                car=Administrador.new(usuario_id:ser.id)
                car.save
                @kikoko="Correctamente agregado"
                ser.nivelu=params["nivelu"]



              elsif ad.to_i==3
                  car=Alumno.new(usuario_id:ser.id)
                  car.save
                  @kikoko="Correctamente agregado"
                  ser.nivelu=params["nivelu"]

              end
    else

      if buscarA != nil
        buscarA.destroy

              if ad.to_i==2
                 car=Profesor.new(usuario_id:ser.id)
                 ser.nivelu=params["nivelu"]
                 car.save
                 @kikoko="Se cambio el tipo usuario"
              elsif  ad.to_i==3
                  car=Alumno.new(usuario_id:ser.id)
                  ser.nivelu=params["nivelu"]
                  car.save
                  @kikoko="Se cambio el tipo usuario"

                elsif  ad.to_i==1
                  car=Administrador.new(usuario_id:ser.id)
                  ser.nivelu=params["nivelu"]
                  car.save
                  @kikoko="Se cambio el tipo usuario"


              end
      end
 begin
      if buscarP !=nil
        buscarP.destroy

          if ad.to_i==2
             car=Profesor.new(usuario_id:ser.id)
             ser.nivelu=params["nivelu"]
             car.save
             @kikoko="Se cambio el tipo usuario"
          elsif  ad.to_i==3
              car=Alumno.new(usuario_id:ser.id)
              ser.nivelu=params["nivelu"]
              car.save
              @kikoko="Se cambio el tipo usuario"

            elsif  ad.to_i==1
              car=Administrador.new(usuario_id:ser.id)
              ser.nivelu=params["nivelu"]
              car.save
              @kikoko="Se cambio el tipo usuario"


            end
        end
    rescue
            @kikoko="El usuario ya tiene una funcion, porfavor dirigase a configuraciones avanzadas"
    end


        if buscarAdmin != nil
          buscarAdmin.destroy

                if ad.to_i==2
                   car=Profesor.new(usuario_id:ser.id)
                   ser.nivelu=params["nivelu"]
                   car.save
                   @kikoko="Se cambio el tipo usuario"
                elsif  ad.to_i==3
                    car=Alumno.new(usuario_id:ser.id)
                    ser.nivelu=params["nivelu"]
                    car.save
                    @kikoko="Se cambio el tipo usuario"

                  elsif  ad.to_i==1
                    car=Administrador.new(usuario_id:ser.id)
                    ser.nivelu=params["nivelu"]
                    car.save
                    @kikoko="Se cambio el tipo usuario"


                end
        end













    end

    ser.save
    render 'gadmin/gusuario'

  end




  def asignarprofsec
    gusuario()

    a=params[:selectedprofe].split('_')[0]
    b= params[:selectedprofe].split('_')[1]

    c=params[:selectedsecc].split('_')[0]
    d=params[:selectedsecc].split('_')[1]


    ff=Seccion.find_by(id:c)

    ff.estado=1
    ff.profesor_id=a

    ff.save
    @kikoko="Profesor #{b} correctamente asignado a la sección #{d}"

    render 'gadmin/gusuario'




  end
  def enlazar
        gusuario()
        a=params[:selectedCurso].split('_')[0]
        b=params[:selectedseme].split('_')[0]
        c=params[:selectedsecc].split('_')[0]
        z=params[:selectedCurso].split('_')[1]
        f=params[:selectedsecc].split('_')[1]
        g=params[:selectedseme].split('_')[1]

        se=Seccion.find_by(id:c)
        se.semestre_id=b
        se.curso_id=a
        se.estado=0
        se.save
        @kikoko="Curso #{z} agregado a la sección #{f} para el semestre #{g}"

        render 'gadmin/gusuario'


  end
  def crearc
    gusuario()

    a = params[:selectedCarrera].split('_')[0]
    b = params[:selectedCarrera].split('_')[1]
    c = params[:selectedCurso].split('_')[0]
    d = params[:selectedCurso].split('_')[1]

    carrera=Carrxcur.new(idcarrera:a,idcurso:c)

    carrera.save
     @kikoko="Listo se agrego el curso #{d} a la carrera #{b}  "
  #    @kikoko=Usuario.select("carreras.nombre").joins("join carreras on carreras.id=usuarios.id")



    render 'gadmin/gusuario'
  end

  def crearcarrera
    gusuario()
    car=Carrera.new(nombre:params["crearcarrera"])

    car.save
    @kikoko="Carrera creada"

    render 'gadmin/gusuario'
  end

  def crearsemestre
      gusuario()
     sem=Semestre.new(fecha:params["crearsemestre"])
     sem.save
     @kikoko="Semestre creado"
       render 'gadmin/gusuario'
  end

  def crearsession
      gusuario()
      secc=Seccion.new(idsec:params["crearsession"])
      secc.save
      @kikoko="Secciòn creada"
        render 'gadmin/gusuario'
  end

  def crearcurso
      gusuario()
      curs=Curso.new(nombre:params["crearcurso"],nivelusuario:1)

      curs.save
      @kikoko="Curso creado"
        render 'gadmin/gusuario'

  end



  def gfacultad
    @asesoria=Curso.select("usuarios.nombre,usuarios.codigo,usuarios.id as idu").joins("join seccions on cursos.id=seccions.curso_id join profesors on profesors.id=seccions.profesor_id join usuarios on usuarios.id=profesors.usuario_id").distinct
    render 'gadmin/gfacultad'

  end
  def modipdf


    a=params["profe"]
    profe=Profesor.find_by(usuario_id:a)


    @all=Usuario.select("usuarios.nombre, citars.cprofesor,citars.calumno,citars.updated_at,citars.created_at,citars.tema,citars.reporte,citars.fecha,citars.resumen").joins("join alumnos on usuarios.id=alumnos.usuario_id join citars on citars.alumno_id=alumnos.id where citars.profesorid=#{profe.id}")
    respond_to do |format|
      format.html
      format.json
      format.pdf {render template:'gadmin/reporteall',pdf:'Reporte',layout:'pdf.html'}
    end

  end

  def gasesorias
     gusuario()
  end

  def cambiarnombre
    getc()
    cursoid=params["idc"]
    nombrec=params["nombre"]
    buscaC=Curso.find_by(id:cursoid)
    buscaC.nombre=nombrec
    buscaC.save
    render 'gadmin/getc'
  end
  def deshabilitar
    getc()
    cursoid=params["idc"]

    buscaC=Curso.find_by(id:cursoid)
    buscaC.nivelusuario=0
    buscaC.save
    @mensaje="Curso #{buscaC.nombre} desabilitado"

    render 'gadmin/getc'

  end

  def habilitar
    getc()
    cursoid=params["idc"]

    buscaC=Curso.find_by(id:cursoid)
    buscaC.nivelusuario=1
    buscaC.save
    @mensaje="Curso #{buscaC.nombre} habilitado"

    render 'gadmin/getc'

  end
  def getc
    @Curso=Curso.select("nombre","id","nivelusuario")



  end


end
