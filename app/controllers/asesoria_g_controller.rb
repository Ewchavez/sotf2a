class AsesoriaGController < ApplicationController
  def alumnosa
  end

  def alumnosb
  end

  def profesoresa


 @todos=Seccion.select("idsec","id","cursos.nombre").joins("join cursos on cursos.id=seccions.curso_id")






  end

  def profesoresb
  end
end
