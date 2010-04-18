# == Schema Information
# Schema version: 20100405032418
#
# Table name: doctors
#
#  id               :integer(4)      not null, primary key
#  apellidoPaterno  :string(255)
#  apellidoMaterno  :string(255)
#  edad             :integer(4)
#  sexo             :string(255)
#  fechaNacimiento  :date
#  ciudadNacimiento :string(255)
#  estadoNacimiento :string(255)
#  especialidad     :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Doctor < ActiveRecord::Base

has_one :usuario, :as => :datos
has_and_belongs_to_many :pacientes

accepts_nested_attributes_for :usuario

validates_presence_of :apellidoPaterno, :apellidoMaterno, :sexo,  :ciudadNacimiento, :estadoNacimiento, :especialidad

ESTADONACIMIENTO = [
  # Displayed         stored in db
  [ "Aguascalientes" , "Aguascalientes" ],
  [ "Baja California" , "Baja California" ],
  [ "Baja California Sur" , "Baja California Sur" ],
	["Campeche","Campeche"],
	["Chiapas","Chiapas"],
	["Chihuahua","Chihuahua"],
	["Colima","Colima"],
	["Distrito Federal","Distrito Federal"],
	["Durango","Durango"],
	["Estado de Mexico","Estado de Mexico"],
	["Guanajuato","Guanajuato"],
	["Guerrero","Guerrero"],
	["Hidalgo","Hidalgo"],
	["Jalisco","Jalisco"],
	["Michoacan","Michoacan"],
	["Morelos","Morelos"],
	["Nayarit","Nayarit"],
	["Nuevo Leon","Nuevo Leon"],
	["Oaxaca","Oaxaca"],
	["Puebla","Puebla"],
	["Queretaro","Queretaro"],
	["Quintana Roo","Quintana Roo"],
	["San Luis Potosi","San Luis Potosi"],
	["Sinaloa","Sinaloa"],
	["Sonora","Sonora"],
	["Tabasco","Tabasco"],
	["Tamaulipas","Tamaulipas"],
	["Tlaxcala","Tlaxcala"],
	["Veracruz","Veracruz"],
	["Yucatan","Yucatan"],
	["Zacatecas","Zacatecas"]
]

end

