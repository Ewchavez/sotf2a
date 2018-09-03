class AddAsesorIdToCitum < ActiveRecord::Migration[5.0]
  def change
    add_reference :citums, :asesor, foreign_key: true
  end
end
