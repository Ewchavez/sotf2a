class AddCalumnoToCitars < ActiveRecord::Migration[5.0]
  def change
    add_column :citars, :calumno, :integer
  end
end
