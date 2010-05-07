class Consulta < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :paciente
end

