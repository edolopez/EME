class AdminController < ApplicationController

def login
if request.post?
    usuario = Usuario.authenticate(params[:id], params[:password])
    if usuario
      session[:usuario_id] = usuario.id
      uri = session[:original_uri]
			session[:original_uri] = nil
			if usuario.datos_type == 'Clinica'
			  redirect_to(clinica_path(Clinica.find(Usuario.find(session[:usuario_id]).datos_id)))
      elsif usuario.datos_type == 'Admin'
			  redirect_to(admin_path(Admin.find(Usuario.find(session[:usuario_id]).datos_id)))
     elsif usuario.datos_type == 'Doctor'
				redirect_to(doctor_path(Doctor.find(Usuario.find(session[:usuario_id]).datos_id)))
     elsif usuario.datos_type == 'Paciente'
		   redirect_to(:controller => "pacientes", :action => "show", :id => Paciente.find(Usuario.find(session[:usuario_id]).datos_id))
      end
    else
      flash.now[:notice] = "El nombre de usuario o password son incorrectos"
    end
  end

end


  def logout
	  session[:usuario_id] = nil
    redirect_to(:action => "login" )
  end

end

