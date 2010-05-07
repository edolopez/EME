class CreateTrabajos < ActiveRecord::Migration
  def self.up
    create_table :trabajos do |t|
      t.integer :doctor_id
      t.integer :clinica_id
      t.date :salida

      t.timestamps
    end
  end

  def self.down
    drop_table :trabajos
  end
end

