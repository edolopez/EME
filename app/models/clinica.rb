# == Schema Information
# Schema version: 20100405032418
#
# Table name: clinicas
#
#  id           :integer(4)      not null, primary key
#  rfc          :string(255)
#  ciudad       :string(255)
#  estado       :string(255)
#  calle        :string(255)
#  colonia      :string(255)
#  codigoPostal :string(255)
#  fax          :string(255)
#  tipoClinica  :string(255)
#  especialidad :string(255)
#  sitioWeb     :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Clinica < ActiveRecord::Base

has_one :usuario, :as => :datos
accepts_nested_attributes_for :usuario

validates_presence_of :rfc, :ciudad, :estado, :calle, :colonia, :codigoPostal, :fax, :tipoClinica, :especialidad

ESTADO = [
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

validates_inclusion_of :estado, :in =>
  ESTADO.map {|disp, value| value}

end

