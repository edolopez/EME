class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.string :nombre
      t.string :correoElectronico
      t.string :telefono
      t.string :hashed_password
      t.string :salt
      t.integer :datos_id
      t.string :datos_type
			t.string :paciente_id

      t.timestamps
    end
  end

  def self.down
    drop_table :usuarios
  end
end
