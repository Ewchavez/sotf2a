class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :contrasena
      t.string :email
      t.integer :codigo
      t.integer :nivelu
    


      t.timestamps
    end
  end
end
