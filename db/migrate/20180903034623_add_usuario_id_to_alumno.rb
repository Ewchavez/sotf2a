class AddUsuarioIdToAlumno < ActiveRecord::Migration[5.0]
  def change
    add_reference :alumnos, :usuario, foreign_key: true
  end
end
