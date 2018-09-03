class CreateSeccions < ActiveRecord::Migration[5.0]
  def change
    create_table :seccions do |t|
      t.integer :capacidad

      t.timestamps
    end
  end
end
