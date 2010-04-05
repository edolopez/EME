class CreatePacientes < ActiveRecord::Migration
  def self.up
    create_table :pacientes do |t|
      t.string :apellidoPaterno
      t.string :apellidoMaterno
      t.integer :edad
      t.string :sexo
      t.date :fechaNacimiento
      t.string :ciudadNacimiento
      t.string :estadoNacimiento
      t.string :estadoCivil
      t.decimal :estatura
      t.string :tipoSangre
      t.boolean :tatuajes
      t.string :religion
      t.decimal :peso
      t.string :preferenciaSexual
      t.string :ocupacion
      t.string :companiaSeguros
      t.string :poliza
			t.integer :expediente_id

      t.timestamps
    end
  end

  def self.down
    drop_table :pacientes
  end
end
