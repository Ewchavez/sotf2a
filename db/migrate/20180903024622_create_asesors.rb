class CreateAsesors < ActiveRecord::Migration[5.0]
  def change
    create_table :asesors do |t|
      t.integer :dia
      t.integer :mes
      t.integer :ano
      t.integer :horai
      t.integer :horaf
      t.string :lugar
      t.string :ubicacion
      t.integer :codl
      t.integer :disponibilidada
      t.integer :atendido
      t.integer :nivelusuario

      t.timestamps
    end
  end
end
