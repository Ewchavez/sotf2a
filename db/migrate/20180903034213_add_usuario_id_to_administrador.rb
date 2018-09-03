class AddUsuarioIdToAdministrador < ActiveRecord::Migration[5.0]
  def change
    add_reference :administradors, :usuario, foreign_key: true
  end
end
