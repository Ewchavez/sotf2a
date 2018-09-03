class AddCursoIdToSeccion < ActiveRecord::Migration[5.0]
  def change
    add_reference :seccions, :curso, foreign_key: true
  end
end
