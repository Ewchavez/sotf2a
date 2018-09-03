class CreateProfesors < ActiveRecord::Migration[5.0]
  def change
    create_table :profesors do |t|
      t.string :especialidad
      t.integer :estado

      t.timestamps
    end
  end
end
