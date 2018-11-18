module Api
    module V1
      class UsuariosController < ApplicationController
        def index
          alumnos=Usuario.select("usuarios.nombre","usuarios.codigo","usuarios.id,nivelu")
          render json: {status: 'SUCCESS', message: 'Usuarios cargados', data: alumnos },status: :ok



        end
        def show

            palabra= "%#{params[:id]}%"
          profe=Usuario.select("usuarios.nombre","profesors.id","usuario_id").joins("join profesors on profesors.usuario_id=usuarios.id").where("lower(usuarios.nombre) LIKE  ? ",palabra.downcase )


          render json: {status: 'SUCCESS', message: 'Usuarios cargados', data: profe },status: :ok

        end
        def create
          alumnos=Usuario.new(alumnos_nuevos)
          if alumnos.save
            render json: {status: 'SUCCESS', message:'Saved alumnos', data:alumnos},status: :ok
          else
            render json: {status: 'ERROR', message:'alumnos not saved', data:alumnos.errors},status: :unprocessable_entity
          end
        end

        def destroy
        alumnos = Usuario.find(params[:id])
        alumnos.destroy
        render json: {status: 'SUCCESS', message:'Deleted alumnos', data:alumnos},status: :ok
        end

        def update
          alumnos = Usuario.find(params[:id])
          if alumnos.update_attributes(alumnos_nuevos)
            render json: {status: 'SUCCESS', message:'Updated alumnos', data:alumnos},status: :ok
          else
            render json: {status: 'ERROR', message:'Article not updated', data:alumnos.errors},status: :unprocessable_entity
          end
        end


        private
        def alumnos_nuevos
          params.permit(:nombre,:codigo,:nivelu )

        end











      end






    end
end
