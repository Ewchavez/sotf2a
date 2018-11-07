module Api
    module V1
      class UsuariosController < ApplicationController
        def index
          usuarios=Usuario.select("usuarios.nombre","usuarios.codigo")
          render json: {status: 'SUCCESS', message: Articules upload', data: usuarios },status: :ok



        end
     
        def create
          alumnos=Usuario.new(articules_params)
          if alumnos.save
            render json: {status: 'SUCCESS', message:'Saved Articules', data:alumnos},status: :ok
          else
            render json: {status: 'ERROR', message:'Articules not saved', data:alumnos.errors},status: :unprocessable_entity
          end
        end

      
        def update
          alumnos = Usuario.find(params[:id])
          if alumnos.update_attributes(articules_params)
            render json: {status: 'SUCCESS', message:'Updated Articules', data:alumnos},status: :ok
          else
            render json: {status: 'ERROR', message:'Articules not updated', data:alumnos.errors},status: :unprocessable_entity
          end
        end


        private
        def articules_params
          params.permit(:nombre,:codigo,:nivelu )

        end











      end






    end
end
