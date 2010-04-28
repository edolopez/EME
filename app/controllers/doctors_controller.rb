class DoctorsController < ApplicationController

def autorizar
end

# Metodo que regresa todos los doctores en la tabla usuarios
def doctores_todos(id)
  Usuario.find_by_datos_id(id, :conditions => "datos_type = 'Doctor'")
end

  # GET /doctors
  # GET /doctors.xml
  def index
    @cont = 0 # Variable para acceso al arreglo de @usuarios en la vista
    @doctors = Doctor.all
    @usuarios = Usuario.find(:all, :conditions => "datos_type = 'Doctor'")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @doctors }
    end
  end

  # GET /doctors/1
  # GET /doctors/1.xml
  def show
    @doctor = Doctor.find(params[:id])
    id = @doctor.id
    @usuario = doctores_todos(id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @doctor }
    end
  end

  # GET /doctors/new
  # GET /doctors/new.xml
  def new
    @doctor = Doctor.new
		@usuario = Usuario.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @doctor }
    end
  end

  # GET /doctors/1/edit
  def edit
    @doctor = Doctor.find(params[:id])
    id = @doctor.id
    @usuario = doctores_todos(id)
  end

  # POST /doctors
  # POST /doctors.xml
  def create
    @doctor = Doctor.new(params[:doctor])
   	@usuario = Usuario.new(params[:usuario])
		@usuario.datos = @doctor

    respond_to do |format|
      if @doctor.valid? && @usuario.valid?
        @doctor.edad = Time.now.year - @doctor.fechaNacimiento.year
        # relacion del trabajo entre doctor creado y clinica en el momento
        Trabajo.create(:doctor => @doctor, :clinica => Clinica.find(Usuario.find(session[:usuario_id]).datos_id))
        @doctor.save
        @usuario.save
        flash[:notice] = 'El Doctor fue creado.'
        if Usuario.find(session[:usuario_id]).datos_type = "Clinica"
          format.html { redirect_to trabajos_path }
        else
          format.html { redirect_to perfil_path }
        end
        format.xml  { render :xml => @doctor, :status => :created, :location => @doctor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @doctor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /doctors/1
  # PUT /doctors/1.xml
  def update
    @doctor = Doctor.find(params[:id])
    id = @doctor.id
    @usuario = doctores_todos(id)

    respond_to do |format|
      if @doctor.update_attributes(params[:doctor]) && @usuario.update_attributes(params[:usuario])
        flash[:notice] = 'Doctor was successfully updated.'
        format.html { redirect_to(@doctor) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @doctor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.xml
  def destroy
    @doctor = Doctor.find(params[:id])
    id = @doctor.id
    @usuario = doctores_todos(id)

    @doctor.destroy
    @usuario.destroy

    respond_to do |format|
      format.html { redirect_to(doctors_url) }
      format.xml  { head :ok }
    end
  end
end

