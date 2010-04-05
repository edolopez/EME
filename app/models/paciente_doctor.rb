# == Schema Information
# Schema version: 20100405032418
#
# Table name: paciente_doctors
#
#  id             :integer(4)      not null, primary key
#  paciente_id    :integer(4)
#  doctor_id      :integer(4)
#  motivoConsulta :string(255)
#  detalles       :text
#  created_at     :datetime
#  updated_at     :datetime
#

class PacienteDoctor < ActiveRecord::Base
end
