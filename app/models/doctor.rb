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
#  fechaNacimiento  :string(255)
#  ciudadNacimiento :string(255)
#  estadoNacimiento :string(255)
#  especialidad     :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Doctor < ActiveRecord::Base
end
