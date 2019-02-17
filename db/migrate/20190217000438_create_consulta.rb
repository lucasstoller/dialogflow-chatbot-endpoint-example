class CreateConsulta < ActiveRecord::Migration
  def change
    create_table :consulta do |t|
      t.string :especialidade
      t.datetime :horario
    end
  end
end
