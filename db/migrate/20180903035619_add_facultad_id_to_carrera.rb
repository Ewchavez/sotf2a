class AddFacultadIdToCarrera < ActiveRecord::Migration[5.0]
  def change
    add_reference :carreras, :facultad, foreign_key: true
  end
end
