class AddAsesorIdToCitar < ActiveRecord::Migration[5.0]
  def change
    add_reference :citars, :asesor, foreign_key: true
  end
end
