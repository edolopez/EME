# == Schema Information
# Schema version: 20100405032418
#
# Table name: usuarios
#
#  id                :integer(4)      not null, primary key
#  nombre            :string(255)
#  correoElectronico :string(255)
#  telefono          :string(255)
#  hashed_password   :string(255)
#  salt              :string(255)
#  datos_id          :integer(4)
#  datos_type        :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class Usuario < ActiveRecord::Base

has_attached_file :imagen, :styles => { :medium => "300x300>", :thumb => "100x100>" }
belongs_to :datos, :polymorphic => true
has_one :pacientes
validates_presence_of :nombre
validates_uniqueness_of :correoElectronico

attr_accessor :password_confirmation
validates_confirmation_of :password

EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates_format_of   :correoElectronico, :with => EmailRegex

TelRegex = /\((\d{3})\)\s+(\d{3})-(\d{4})/ #(123) 555-1234
validates_format_of :telefono, :with => TelRegex

 validate :password_non_blank
  
def self.authenticate(id, password)
    usuario = self.find_by_id(id)
    if usuario
      expected_password = encrypted_password(password, usuario.salt)
      if usuario.hashed_password != expected_password
         usuario = nil
      end
    end
    usuario
  end
  # 'password' is a virtual attribute
  def password
    @password
  end

  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = Usuario.encrypted_password(self.password, self.salt)
  end

private
  def password_non_blank
    errors.add(:password, "Missing password" ) if hashed_password.blank?
  end
                                                                                   
def create_new_salt
  self.salt = self.object_id.to_s + rand.to_s
end
def self.encrypted_password(password, salt)
  string_to_hash = password + "wibble" + salt
  Digest::SHA1.hexdigest(string_to_hash)
end

def self.busqueda(busqueda)
		if busqueda
find_by_sql("SELECT * FROM pacientes WHERE id = '#{busqueda}'")


end
	
end

end
