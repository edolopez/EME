class UsuariosController < ApplicationController

before_filter :autorizar, :only => [:show, :busqueda, :index, :edit]


def index

@usuarios = Usuario.busqueda(params[:busqueda])

end
  # GET /usuarios/1
  # GET /usuarios/1.xml
  def show

    @usuario = Usuario.find(session[:usuario_id])
  end

  # GET /usuarios/new
  # GET /usuarios/new.xml
  def new

    @usuario = Usuario.new

  end

  # GET /usuarios/1/edit
  def edit

    @usuario = Usuario.find(session[:usuario_id])

  end

  # POST /usuarios
  # POST /usuarios.xml
  def create
    @usuario = Usuario.new(params[:usuario])
    #@usuario.datos_id = -1
    #@usuario.datos_type = "Root"

    respond_to do |format|
      if @usuario.save
        flash[:notice] = 'El usuario fue creado satisfactoriamente.'
					session[:usuario_id] = @usuario.id
        format.html { redirect_to(:controller => "admin", :action => "login" ) }

      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /usuarios/1
  # PUT /usuarios/1.xml
  def update
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      if @usuario.update_attributes(params[:usuario])
        flash[:notice] = 'El usuario fue actualizado correctamente.'
        format.html { redirect_to :back }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @usuario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.xml
  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy

    respond_to do |format|
      format.html { redirect_to(usuarios_url) }
      format.xml  { head :ok }
    end
  end



end

