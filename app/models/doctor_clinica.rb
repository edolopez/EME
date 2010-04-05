# == Schema Information
# Schema version: 20100405032418
#
# Table name: doctor_clinicas
#
#  id         :integer(4)      not null, primary key
#  doctor_id  :integer(4)
#  clinica_id :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class DoctorClinica < ActiveRecord::Base
end
