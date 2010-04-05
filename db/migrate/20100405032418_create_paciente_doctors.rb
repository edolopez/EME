class CreatePacienteDoctors < ActiveRecord::Migration
  def self.up
    create_table :paciente_doctors do |t|
      t.integer :paciente_id
      t.integer :doctor_id
			t.string :motivoConsulta
			t.text :detalles

      t.timestamps
    end
  end

  def self.down
    drop_table :paciente_doctors
  end
end
