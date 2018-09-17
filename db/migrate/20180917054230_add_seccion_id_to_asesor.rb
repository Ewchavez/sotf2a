class AddSeccionIdToAsesor < ActiveRecord::Migration[5.0]
  def change
    add_reference :asesors, :seccion, foreign_key: true
  end
end
