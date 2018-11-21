class AddSemanaToAsesors < ActiveRecord::Migration[5.0]
  def change
    add_column :asesors, :semana, :string
  end
end
