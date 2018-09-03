class AddAlumnoIdToCitum < ActiveRecord::Migration[5.0]
  def change
    add_reference :citums, :alumno, foreign_key: true
  end
end
