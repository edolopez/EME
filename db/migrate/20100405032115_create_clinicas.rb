class CreateClinicas < ActiveRecord::Migration
  def self.up
    create_table :clinicas do |t|
      t.string :rfc
      t.string :ciudad
      t.string :estado
      t.string :calle
      t.string :colonia
      t.string :codigoPostal
      t.string :fax
      t.string :tipoClinica
      t.string :especialidad
      t.string :sitioWeb

      t.timestamps
    end
  end

  def self.down
    drop_table :clinicas
  end
end
