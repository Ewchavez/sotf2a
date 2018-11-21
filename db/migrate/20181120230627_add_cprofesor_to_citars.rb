class AddCprofesorToCitars < ActiveRecord::Migration[5.0]
  def change
    add_column :citars, :cprofesor, :integer
  end
end
