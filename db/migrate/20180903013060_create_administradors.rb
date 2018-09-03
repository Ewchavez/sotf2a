class CreateAdministradors < ActiveRecord::Migration[5.0]
  def change
    create_table :administradors do |t|
      t.string :foto
      t.string :log
    
      t.timestamps
    end
  end
end
