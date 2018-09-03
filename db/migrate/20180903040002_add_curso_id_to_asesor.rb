class AddCursoIdToAsesor < ActiveRecord::Migration[5.0]
  def change
    add_reference :asesors, :curso, foreign_key: true
  end
end
