class CreateAlumnos < ActiveRecord::Migration[5.0]
  def change
    create_table :alumnos do |t|
      t.integer :recorda
      t.integer :estado

      t.timestamps
    end
  end
end
