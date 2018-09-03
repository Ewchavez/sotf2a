class AddSemestreIdToSeccion < ActiveRecord::Migration[5.0]
  def change
    add_reference :seccions, :semestre, foreign_key: true
  end
end
