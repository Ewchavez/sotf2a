class AddSemanaToCitars < ActiveRecord::Migration[5.0]
  def change
    add_column :citars, :semana, :string
  end
end
