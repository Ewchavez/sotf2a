module Api
    module V1
      class UsuariosController < ApplicationController
        def index
          alumnos=Usuario.select("usuarios.nombre","usuarios.codigo","usuarios.id,nivelu")
          render json: {status: 'SUCCESS', message: 'Usuarios cargados', data: alumnos },status: :ok



        end


        def show
          alumnos=Usuario.select("usuarios.nombre","alumnos.id","usuario_id").joins("join alumnos on alumnos.usuario_id=usuarios.id").where("alumnos.id":params[:id])
        

          render json: {status: 'SUCCESS', message: 'Usuarios cargados', data: alumnos },status: :ok

        end
       
        def destroy
        alumnos = Usuario.find(params[:id])
        alumnos.destroy
        render json: {status: 'SUCCESS', message:'Deleted alumnos', data:alumnos},status: :ok
        end











      end






    end
end
