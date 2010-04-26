class AdminController < ApplicationController

def login
  if request.post?
    usuario = Usuario.authenticate(params[:id], params[:password])
    if usuario

      session[:usuario_id] = usuario.id
      uri = session[:original_uri]
			session[:original_uri] = nil
			if usuario.datos_type == 'Clinica'
			  redirect_to(uri || clinica_path)
      else
		    redirect_to(uri || paciente_path(usuario.id))
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

