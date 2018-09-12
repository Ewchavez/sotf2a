class LoginController < ApplicationController
  def inicio
    @messages = Message.last(5)
    @idUsuario="Ingresar"


  end

  def verificar
      inicio()
       cod = params[:codigou]
       contrasenia = params[:clave]


         if  Usuario.find_by(codigo: params[:codigou] , contrasena:params[:clave])
           gg=Usuario.find_by(codigo: params[:codigou] , contrasena:params[:clave])

           @mensaje = false

           session[:usuario]=cod

               if gg.nivelu==1

               redirect_to('/gadmin/gusuario')  and return
               render 'login/inicio'
               elsif gg.nivelu==2
                 redirect_to('/asesoria_g/profesoresa')  and return
                 render 'login/inicio'

               elsif gg.nivelu==3
                 redirect_to('/asesoria_g/alumnosa')  and return
                 render 'login/inicio'

               elsif gg.nivelu==nil
                  @mensaje = 2
                  render 'login/inicio'






                end

         else
           @mensaje = true
           render 'login/inicio'


          end
    end

   def  enviarU

   end


  def registrar
    inicio()
  userReg=params[:codigou]
  contrasenia =params[:clave]
  buscarU=Usuario.find_by(codigo:userReg)

      if buscarU==nil
        nuevo=Usuario.create(codigo: params[:codigou] , contrasena:params[:clave])

         nuevo.save
             @mensaje1 = true
             render 'login/inicio'
           else
             @mensaje1 = false
              render 'login/inicio'
           end

        end

  def admin
        adminis= Usuario.find_by(codigo:1111)

        if adminis==nil

          nuevo=Usuario.create(codigo: 1111 , contrasena:"admin",nivelu:1)
          nuevo.save
          redirect_to('/login/inicio')  and return
          render 'login/inicio'

        else
          redirect_to('/login/inicio')  and return
          render 'login/inicio'




        end

  end


end
