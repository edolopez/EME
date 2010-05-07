class PacientesController < ApplicationController

before_filter :autorizar, :only => [:show, :edit, :datos, :update, :destroy]

  # GET /pacientes
  # GET /pacientes.xml
  def index

				@cont = 0 # Variable para acceso al arreglo de @usuarios en la vista
  			@pacientes = Paciente.all
				@usuarios = Usuario.find(:all, :conditions => "datos_type = 'Paciente'")
  end

  # GET /pacientes/1
  # GET /pacientes/1.xml
  def show

  @paciente = Paciente.find(Usuario.find(session[:usuario_id]).datos_id)
   @usuario = Usuario.find(session[:usuario_id])


  end

  # GET /pacientes/new
  # GET /pacientes/new.xml
  def new

    @paciente = Paciente.new
		@usuario = Usuario.new
		@title = "Nuevo paciente"


  end

  # GET /pacientes/1/edit
  def edit

    @paciente = Paciente.find(params[:id])
    id = @paciente.id
    @usuario = Usuario.find_by_datos_id(id, :conditions => "datos_type = 'Paciente'")

  end

  # POST /pacientes
  # POST /pacientes.xml
  def create
    @paciente = Paciente.new(params[:paciente])
		@usuario = Usuario.new(params[:usuario])
		@usuario.datos = @paciente

    respond_to do |format|
      if @paciente.valid? && @usuario.valid?
        @paciente.edad = Time.now.year - @paciente.fechaNacimiento.year
        @paciente.save
        @usuario.save
        flash[:notice] = 'El paciente fue creado satisfactoriamente'
        format.html { redirect_to :controller => "pacientes", :action => "index" }
        format.xml  { render :xml => @paciente, :status => :created, :location => @paciente }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @paciente.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pacientes/1
  # PUT /pacientes/1.xml
  def update
    @paciente = Paciente.find(params[:id])
    id = @paciente.id
    @usuario = Usuario.find_by_datos_id(id, :conditions => "datos_type = 'Paciente'")

    respond_to do |format|
      if @paciente.update_attributes(params[:paciente]) && @usuario.update_attributes(params[:usuario])
        flash[:notice] = 'El paciente fue actualizado correctamente.'
        format.html { redirect_to :back }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @paciente.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pacientes/1
  # DELETE /pacientes/1.xml
  def destroy
    @paciente = Paciente.find(params[:id])
    id = @paciente.id
    @usuario = Usuario.find_by_datos_id(id, :conditions => "datos_type = 'Paciente'")

    @paciente.destroy
    @usuario.destroy

    respond_to do |format|
      format.html { redirect_to(pacientes_url) }
      format.xml  { head :ok }
    end
  end

	def datos
		@paciente = Paciente.find(params[:id])
		  id = @paciente.id
		@usuario = Usuario.find_by_datos_id(id, :conditions => "datos_type = 'Paciente'")
		@cont = 1
  end

  def citas
		@paciente = Paciente.find(params[:id])
    @doctor = Doctor.find(Usuario.find(session[:usuario_id]).datos_id)
    @consulta = Consulta.new
  end

  def consulta
    @paciente = Paciente.find(params[:id])
    @doctor = Doctor.find(Usuario.find(session[:usuario_id]).datos_id)
    @consulta = Consulta.new(params[:consulta])
    @consulta.doctor = @doctor
    @consulta.paciente = @paciente
    #@consulta.nombre_clinica = @doctor.clinicas
    #>> doctor.clinicas[0].usuario.nombre
    #=> "Conchita"


    respond_to do |format|
      if @consulta.save
        flash[:notice] = 'Consulta was successfully created.'
        format.html { redirect_to :controller => "pacientes", :action => "datos", :id => @paciente.id }
        format.xml  { render :xml => @consulta, :status => :created, :location => @consulta }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @consulta.errors, :status => :unprocessable_entity }
      end
    end
  end

end

