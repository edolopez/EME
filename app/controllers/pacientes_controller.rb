class PacientesController < ApplicationController

def autorizar
end

  # GET /pacientes
  # GET /pacientes.xml
  def index

#		@pacientes = Paciente.find(:all, :conditions => ['apellidoMaterno LIKE ?', "%#{params[:busqueda]}%"])

  @cont = 0 # Variable para acceso al arreglo de @usuarios en la vista
  @pacientes = Paciente.all
  @usuarios = Usuario.find(:all, :conditions => "datos_type = 'Paciente'")

   respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pacientes }
end
  end

  # GET /pacientes/1
  # GET /pacientes/1.xml
  def show
  @paciente = Paciente.find(params[:id])
	id = @paciente.id
    @usuario = Usuario.find_by_datos_id(id, :conditions => "datos_type = 'Paciente'")

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @paciente }
    end
  end

  # GET /pacientes/new
  # GET /pacientes/new.xml
  def new
    @paciente = Paciente.new
		@usuario = Usuario.new
		@title = "Nuevo paciente"
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @paciente }
    end
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
        flash[:notice] = 'Paciente was successfully created.'
        format.html { redirect_to(@paciente) }
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
        flash[:notice] = 'Paciente was successfully updated.'
        format.html { redirect_to(@paciente) }
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
end

