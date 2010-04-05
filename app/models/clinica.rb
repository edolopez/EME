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

validates_presence_of :rfc, :ciudad, :estado, :calle, :colonia, :codigoPostal, :fax, :tipoClinica, :especialidad


end
