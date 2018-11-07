module Api
    module V1
      class CitasaController < ApplicationController


        def index
          citas=Citar.order('created_at DESC');
          render json: {status: 'SUCCESS', message: 'Citas cargados', data: citas },status: :ok



        end

        def show
          citas=Citar.select("asesors.lugar,citars.fecha as fc,citars.id,cursos.nombre").joins("join asesors on citars.asesor_id=asesors.id join seccions on asesors.seccion_id=seccions.id join cursos on cursos.id=seccions.curso_id where citars.alumno_id=#{params[:id]} ")


          render json: {status: 'SUCCESS', message: 'Citas cargados', data: ["Mis citas",citas] },status: :ok

        end
        def create
          citas=Citar.new(citas_nuevos)
          if citas.save
            render json: {status: 'SUCCESS', message:'Saved citas', data:citas},status: :ok
          else
            render json: {status: 'ERROR', message:'citas not saved', data:citas.errors},status: :unprocessable_entity
          end
        end

        def destroy
        citas = Citar.find(params[:id])
        citas.destroy
        render json: {status: 'SUCCESS', message:'Deleted citas', data:citas},status: :ok
        end

        def update
          citas = Citar.find(params[:id])
          if citas.update_attributes(citas_nuevos)
            render json: {status: 'SUCCESS', message:'Updated citas', data:citas},status: :ok
          else
            render json: {status: 'ERROR', message:'Cita not updated', data:citas.errors},status: :unprocessable_entity
          end
        end


        private
        def citas_nuevos
          params.permit(:alumno_id,:asesor_id,:fecha,:profesorid,:tema,:resumen)

        end







      end
  end
end
