class AddUsuarioIdToProfesor < ActiveRecord::Migration[5.0]
  def change
    add_reference :profesors, :usuario, foreign_key: true
  end
end
