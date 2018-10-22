class AddFechaToCitars < ActiveRecord::Migration[5.0]
  def change
    add_column :citars, :fecha, :date
  end
end
