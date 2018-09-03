class CreateCursos < ActiveRecord::Migration[5.0]
  def change
    create_table :cursos do |t|
      t.string :nombre
      t.integer :creditos
      t.integer :nivel
      t.integer :nivelusuario

      t.timestamps
    end
  end
end
