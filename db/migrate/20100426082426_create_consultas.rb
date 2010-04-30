class CreateConsultas < ActiveRecord::Migration
  def self.up
    create_table :consultas do |t|
      t.integer :paciente_id
      t.integer :doctor_id
      t.string :motivo
      t.date :fecha
      t.time :hora
      t.text :detalles
			t.string :nombre_clinica

      t.timestamps
    end
  end

  def self.down
    drop_table :consultas
  end
end
