class CreateDoctorClinicas < ActiveRecord::Migration
  def self.up
    create_table :doctor_clinicas do |t|
      t.integer :doctor_id
      t.integer :clinica_id

      t.timestamps
    end
  end

  def self.down
    drop_table :doctor_clinicas
  end
end
