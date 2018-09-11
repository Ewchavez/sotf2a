class LoginController < ApplicationController
  def inicio
    @messages = Message.all
    @idUsuario="Ingresar"
  end

  def verificar
       cod = params[:codigou]
       contrasenia = params[:clave]

       if  Usuario.find_by(codigo: params[:codigou] , contrasena:params[:clave])
         @mensaje = false

         session[:usuario]=cod

         redirect_to('/gadmin/gusuario')  and return
         render 'login/inicio'

       else
         @mensaje = true
         render 'login/inicio'


       end
    end

   def  enviarU

   end


  def registrar

  userReg=params[:codigou]
  contrasenia =params[:clave]
  buscarU=Usuario.find_by(codigo:userReg)



if buscarU==nil
  nuevo=Usuario.create(codigo: params[:codigou] , contrasena:params[:clave])

   nuevo.save
   @mensaje = true
   redirect_to('/gadmin/gusuario')
 else
   @mensaje = false
     render 'login/regis'
 end

  end


end
