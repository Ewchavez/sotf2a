class AddCarreraIdToCurso < ActiveRecord::Migration[5.0]
  def change
    add_reference :cursos, :carrera, foreign_key: true
  end
end
