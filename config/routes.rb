Rails.application.routes.draw do

  #Gadmin
  get 'gadmin/asignarU'

  get 'gadmin/crearcurso'
  get 'gadmin/vercurso'
  post 'gadmin/editarcurso'
  get 'gadmin/eliminarcurso'
  get 'gadmin/crearcarrera'
  get 'gadmin/crearsemestre'
  get 'gadmin/crearsession'
  get 'gadmin/crearc'
  get 'gadmin/enlazar'
  get 'gadmin/asignars'
  get 'gadmin/asignarprofsec'
  get 'gadmin/opcionesavanzad'

  get 'asesoria_g/cursoselec'
  get 'asesoria_g/eliminarasesoriaprof'


  get 'asesoria_g/cursoselec'
  get "asesoria_g/realizareport"
  get 'asesoria_g/gcita'
  get 'crearasesoria'=>'asesoria_g/crearasesoria'
  get 'asesoria_g/crearasesoria'
  get 'asesoria_g/carreraelecta'
  get 'asesoria_g/cursopselec'
  get 'asesoria_g/buscador'
  get 'asesoria_g/profeselec'
  get 'asesoria_g/solicitarase'
  get 'asesoria_g/vercita'
  get 'asesoria_g/asignartema'
    get 'asesoria_g/eliminaraseso'
  resources :cursos


  #------------------------------------------------------------------------
  get 'asesoria_g/alumnosa'

  get 'asesoria_g/alumnosb'

  get 'asesoria_g/profesoresa'

  get 'asesoria_g/profesoresb'

  get 'gadmin/gusuario'

  get 'gadmin/gfacultad'

  get 'gadmin/gasesorias'

  get 'gadmin/getc'
  get 'login/admin'
  root to: 'login#inicio'
  get 'login/registrar'
  get 'login/inicio'

  get 'rooms/show'
  post 'login/verificar'





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
