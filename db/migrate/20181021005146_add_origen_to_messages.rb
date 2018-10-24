class AddOrigenToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :origen, :integer
    add_column :messages, :destino, :integer
  end
end
