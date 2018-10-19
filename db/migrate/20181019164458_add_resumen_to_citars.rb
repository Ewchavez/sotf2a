class AddResumenToCitars < ActiveRecord::Migration[5.0]
  def change
    add_column :citars, :resumen, :string
    add_column :citars, :reporte, :string
  end
end
