class ClinicasController < ApplicationController

before_filter :autorizar, :only => [:show, :busqueda,:index, :edit]


  # Metodo que regresa todos los doctores en la tabla usuarios
  def clinicas_todas(id)
    Usuario.find_by_datos_id(id, :conditions => "datos_type = 'Clinica'")
  end

  # GET /clinicas
  # GET /clinicas.xml
  def index


    @cont = 0 # Variable para acceso al arreglo de @usuarios en la vista
    @clinicas = Clinica.all
    @usuarios = Usuario.find(:all, :conditions => "datos_type = 'Clinica'")


  end

  # GET /clinicas/1
  # GET /clinicas/1.xml
  def show

    @usuario = Usuario.find(session[:usuario_id])
    @clinica = Clinica.find(@usuario.datos_id)
    
  end

  # GET /clinicas/new
  # GET /clinicas/new.xml
  def new

    @clinica = Clinica.new
    @usuario = Usuario.new
    
  end

  # GET /clinicas/1/edit
  def edit

    @clinica = Clinica.find(params[:id])
    id = @clinica.id
    @usuario = clinicas_todas(id)

     end

  # POST /clinicas
  # POST /clinicas.xml
  def create
    @clinica = Clinica.new(params[:clinica])
    @usuario = Usuario.new(params[:usuario])
		@usuario.datos = @clinica

		# @clinica.sitioWeb = "http://#{@clinica.sitioWeb}"

    respond_to do |format|
      if @clinica.valid? && @usuario.valid?
        @clinica.save
        @usuario.save
        flash[:notice] = 'La clinica fue creada satisfactoriamente'
        format.html { redirect_to clinicas_path}
        format.xml  { render :xml => @clinica, :status => :created, :location => @clinica }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @clinica.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clinicas/1
  # PUT /clinicas/1.xml
  def update
		@clinica = Clinica.find(params[:id])
		  id = @clinica.id
		@usuario = Usuario.find_by_datos_id(id, :conditions => "datos_type = 'Clinica'")

    # @clinica.sitioWeb = "http://#{@clinica.sitioWeb}"

    respond_to do |format|
      if @clinica.valid? && @usuario.valid?
				@clinica.update_attributes(params[:clinica])
				@usuario.update_attributes(params[:usuario])
        flash[:notice] = 'La clinica fue actualizada satisfactoriamente'
        format.html { redirect_to :back }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @clinica.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clinicas/1
  # DELETE /clinicas/1.xml
  def destroy
    @clinica = Clinica.find(params[:id])
    id = @clinica.id
    @usuario = clinicas_todas(id)

    @clinica.destroy
    @usuario.destroy

    respond_to do |format|
      format.html { redirect_to(clinicas_url) }
      format.xml  { head :ok }
    end
  end

	def datos

		@clinica = Clinica.find(params[:id])
		  id = @clinica.id
		@usuario = Usuario.find_by_datos_id(id, :conditions => "datos_type = 'Clinica'")
	
end
end

