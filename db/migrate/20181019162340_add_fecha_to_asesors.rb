class AddFechaToAsesors < ActiveRecord::Migration[5.0]
  def change
    add_column :asesors, :fecha, :date
  end
end
