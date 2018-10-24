class AddProfesoridToCitars < ActiveRecord::Migration[5.0]
  def change
    add_column :citars, :profesorid, :integer
  end
end
