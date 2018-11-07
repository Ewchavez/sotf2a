class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.integer :origen
      t.integer :destino
      t.integer :channel

      t.timestamps
    end
  end
end
