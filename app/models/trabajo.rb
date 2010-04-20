class Trabajo < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :clinica

# Ejemplo de un doctor y sus trabajos en las clinicas
#>> doctor.clinicas
#=> []
#>> doctor
#=> #<Doctor id: 1, apellidoPaterno: "Cantú", apellidoMaterno: "Gámez", edad: 12, sexo: "Masculino", fechaNacimiento: "1998-03-16", ciudadNacimiento: "Monterrey", estadoNacimiento: "Nuevo Leon", especialidad: "Pediatra", created_at: "2010-04-15 21:18:11", updated_at: "2010-04-15 21:18:11">

#trabajo = Trabajo.new
#trabajo.doctor = @doctor (objeto entero)
#trabajo.clinica = @clinica (objeto entero)

end

