class CreateConsulta < ActiveRecord::Migration
  def change
    create_table :consulta do |t|
      t.string :especialidade
      t.date :data
      t.time :horario
      
      t.timestamps
    end
  end
end
