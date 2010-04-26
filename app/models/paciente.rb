# == Schema Information
# Schema version: 20100405032418
#
# Table name: pacientes
#
#  id                :integer(4)      not null, primary key
#  apellidoPaterno   :string(255)
#  apellidoMaterno   :string(255)
#  edad              :integer(4)
#  sexo              :string(255)
#  fechaNacimiento   :date
#  ciudadNacimiento  :string(255)
#  estadoNacimiento  :string(255)
#  estadoCivil       :string(255)
#  estatura          :integer(10)
#  tipoSangre        :string(255)
#  tatuajes          :boolean(1)
#  religion          :string(255)
#  peso              :integer(10)
#  preferenciaSexual :string(255)
#  ocupacion         :string(255)
#  companiaSeguros   :string(255)
#  poliza            :string(255)
#  expediente_id     :integer(4)
#  created_at        :datetime
#  updated_at        :datetime
#

class Paciente < ActiveRecord::Base

has_one :usuario, :as => :datos
belongs_to :usuario
validates_presence_of :apellidoPaterno, :apellidoMaterno, :sexo, :ciudadNacimiento,
																	  :estadoNacimiento, :estadoCivil, :estatura, :tipoSangre,
																		:religion, :peso, :preferenciaSexual, :ocupacion, :companiaSeguros,
																		:poliza

validates_numericality_of :estatura, :peso

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

validates_inclusion_of :estadoNacimiento, :in =>
  ESTADONACIMIENTO.map {|disp, value| value}

 ESTADOCIVIL = [
  # Displayed         stored in db
  [ "Casado" , "Casado" ],
	[ "Divorciado" , "Divorciado" ],
	[ "Viudo" , "Viudo" ],
	[ "Soltero" , "Soltero" ]
]

validates_inclusion_of :estadoCivil, :in =>
ESTADOCIVIL.map {|disp, value| value}


RELIGION = [
  # Displayed         stored in db
  [ "Anglicanismo" , "Anglicanismo" ],
	[ "Ateismo" , "Ateismo" ],
	[ "Brahamanismo" , "Brahamanismo" ],
	[ "Budismo" , "Budismo" ],
	[ "Catolicismo" , "Catolicismo" ],
	[ "Confucianismo" , "Confucianismo" ],
	[ "Protestantismo" , "Protestantismo" ],
	[ "Luteranos" , "Luteranos" ],
	[ "Calvinista" , "Calvinista" ],
	[ "Hinduismo" , "Hinduismo" ],
	[ "Judaismo" , "Judaismo" ],
	[ "Shintoismo" , "Shintoismo" ],
	[ "Islamismo" , "Islamismo" ],
	[ "Taoismo" , "Taoismo" ]

]

validates_inclusion_of :religion, :in =>
RELIGION.map {|disp, value| value}

TIPOSANGRE = [
  # Displayed         stored in db
  [ "AB -" , "AB-" ],
	[ "B -" , "B-" ],
	[ "B +" , "B+" ],
	[ "A +" , "A+" ],
	["A -","A-"],
	["O +", "O+"],
	["O -", "O-"]
]

validates_inclusion_of :tipoSangre, :in =>
TIPOSANGRE.map {|disp, value| value}


end

