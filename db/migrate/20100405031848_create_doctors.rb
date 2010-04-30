class CreateDoctors < ActiveRecord::Migration
  def self.up
    create_table :doctors do |t|
      t.string :apellidoPaterno
      t.string :apellidoMaterno
      t.integer :edad
      t.string :sexo
      t.date :fechaNacimiento
      t.string :ciudadNacimiento
      t.string :estadoNacimiento
      t.string :especialidad

      t.timestamps
    end
  end

  def self.down
    drop_table :doctors
  end
end
