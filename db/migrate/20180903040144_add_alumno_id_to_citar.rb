class AddAlumnoIdToCitar < ActiveRecord::Migration[5.0]
  def change
    add_reference :citars, :alumno, foreign_key: true
  end
end
