module Api
    module V1
      class AsesosController < ApplicationController


        def index
          asesorias=Asesor.order('created_at DESC');
          render json: {status: 'SUCCESS', message: 'Lista de Asesorias', data: asesorias },status: :ok


            

        end

        def show
          asesorias=Asesor.select("id","fecha","idsec","dia","lugar","horai","cursos.nombre").joins("join seccions on asesors.seccion_id=seccions.id join cursos on seccions.curso_id=cursos.id where seccions.idsec=#{params[:id]}")


          render json: {status: 'SUCCESS', message: 'Citas cargados', data: ["Mis Asesorias",asesorias] },status: :ok

        end
        def create
          asesorias=Asesor.new(asesorias_nuevos)
          if asesorias.save
            render json: {status: 'SUCCESS', message:'Saved asesorias', data:asesorias},status: :ok
          else
            render json: {status: 'ERROR', message:'asesorias not saved', data:asesorias.errors},status: :unprocessable_entity
          end
        end

        def destroy
        asesorias = Asesor.find(params[:id])
        asesorias.destroy
        render json: {status: 'SUCCESS', message:'Deleted asesorias', data:asesorias},status: :ok
        end

        def update
          asesorias = Asesor.find(params[:id])
          if asesorias.update_attributes(asesorias_nuevos)
            render json: {status: 'SUCCESS', message:'Updated asesorias', data:asesorias},status: :ok
          else
            render json: {status: 'ERROR', message:'Cita not updated', data:asesorias.errors},status: :unprocessable_entity
          end
        end


        private
        def asesorias_nuevos
          params.permit(:seccion_id,:fecha,:lugar)

        end







      end
  end
end
