class CreateCarrxcurs < ActiveRecord::Migration[5.0]
  def change
    create_table :carrxcurs do |t|
      t.integer :idcarrera
      t.integer :idcurso

      t.timestamps
    end
  end
end
