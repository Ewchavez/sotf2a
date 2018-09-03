class CreateCitums < ActiveRecord::Migration[5.0]
  def change
    create_table :citums do |t|
      t.integer :dia
      t.integer :mes
      t.integer :ano
      t.string :tema

      t.timestamps
    end
  end
end
