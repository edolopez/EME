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

# Lineas para la relacion many-to-many con la posibilidad de agregar mas atributos
# en la tabla join
has_many :trabajos
has_many :clinicas, :through => :trabajos

has_many :consultas
has_many :pacientes, :through => :consultas



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

validates_inclusion_of :estadoNacimiento, :in =>
  ESTADONACIMIENTO.map {|disp, value| value}

ESPECIALIDAD = [
  # Displayed         stored in db
  [ "Alergología" , "Alergologia" ],
  [ "Algología" , "Algologia" ],
  [ "Anestesiología" , "Anestesiologia" ],
	["Angiología y cirugía vascular","Angiologia y cirugia vascular"],
	["Audiología, foniatría","Audiologia, foniatria"],
	["Bariatría","Bariatria"],
	["Cardiología","Cardiologia"],
	["Cirugía plática y reconstructiva","Cirugia platica y reconstructiva"],
	["Coloproctología","Coloproctologia"],
	["Dermatología","Dermatologia"],
	["Dermatología pediátrica","Dermatologia pediatrica"],
	["Endocrinología","Endocrinologia"],
	["Endoscopía","Endoscopia"],
	["Endodoncia","Endodoncia"],
	["Gastroenterología","Gastroenterologia"],
	["Genética","Genetica"],
	["Geriatría","Geriatria"],
	["Gerontología","Gerontología"],
	["Ginecología","Ginecologia"],
	["Hematología","Hematologia"],
	["Hemato-Oncología","Hemato-Oncologia"],
	["Hepatología","Hepatologia"],
	["Imagenología","Imagenologia"],
	["Infectología","Infectologia"],
	["Inhaloterapia","Inhaloterapia"],
	["Inmunología clínica y alergología pediátrica","Inmunologia clinica y alergologia pediatrica"],
	["Medicina física y de rehabilitación","Medicina fisica y de rehabilitacion"],
	["Medicina Crítica","Medicina Critica"],
	["Medicina general","Medicina general"],
	["Medicina familiar","Medicina familiar"],
	["Medicina del deporte","Medicina del deporte"],
	["Medicina Nuclear" , "Medicina Nuclear" ],
  ["Medicina preventiva" , "Medicina preventiva" ],
  ["Nefrología" , "Nefrologia" ],
	["Neonatología","Neonatologia"],
	["Neumología","Neumologia"],
	["Neurocirugía","Neurocirugia"],
	["Neuroradiología","Neuroradiologia"],
	["Nutriología","Nutriologia"],
	["Odontología","Odontologia"],
	["Oftalmología","Oftalmologia"],
	["Oncología","Oncologia"],
	["Técnico Ortesista","Técnico Ortesista"],
	["Ortopedia","Ortopedia"],
	["Otorrinolaringología","Otorrinolaringologia"],
	["Patología","Patología"],
	["Pediatría","Pediatria"],
	["Perinatología","Perinatologia"],
	["Proctología","Proctologia"],
	["Psicología","Psicologia"],
	["Psiquiatría","Psiquiatria"],
	["Quiropraxia","Quiropraxia"],
	["Radiología","Radiologia"],
	["Radioterapia","Radioterapia"],
	["Rehabilitación pulmonar","Rehabilitacion pulmonar"],
	["Reumatología","Reumatologia"],
	["Traumatología y ortopedia","Traumatologia y ortopedia"],
	["Traumatología deportiva","Traumatologia deportiva"],
	["Urología","Urologia"]
]

validates_inclusion_of :especialidad, :in =>
  ESPECIALIDAD.map {|disp, value| value}



end

