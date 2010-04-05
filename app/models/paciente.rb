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

validates_presence_of :apellidoPaterno, :apellidoMaterno, :edad, :sexo, :ciudadNacimiento,
																	  :estadoNacimiento, :estadoCivil, :estatura, :tipoSangre, :tatuajes,
																		:religion, :peso, :preferenciaSexual, :ocupacion, :companiaSeguros, 
																		:poliza

validates_numericality_of :edad, :estatura, :peso


end
