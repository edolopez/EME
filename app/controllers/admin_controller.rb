class AdminController < ApplicationController
 
def login
  if request.post?
    usuario = Usuario.authenticate(params[:nombre], params[:password])
    if usuario
			
      session[:usuario_id] = usuario.id
      uri = session[:original_uri]
			session[:original_uri] = nil
			redirect_to(uri || perfil_path)
			
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
