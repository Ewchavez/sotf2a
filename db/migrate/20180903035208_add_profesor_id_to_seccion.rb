class AddProfesorIdToSeccion < ActiveRecord::Migration[5.0]
  def change
    add_reference :seccions, :profesor, foreign_key: true
  end
end
