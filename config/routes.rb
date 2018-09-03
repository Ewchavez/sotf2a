Rails.application.routes.draw do
  get 'asesoria_g/alumnosa'

  get 'asesoria_g/alumnosb'

  get 'asesoria_g/profesoresa'

  get 'asesoria_g/profesoresb'

  get 'gadmin/gusuario'

  get 'gadmin/gfacultad'

  get 'gadmin/gasesorias'

  get 'gadmin/getc'

  get 'login/inicio'
  get 'login/regis'

  get 'rooms/show'
  post 'login/verificar'

  get 'login/registrar'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
