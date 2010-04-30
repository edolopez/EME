class TrabajosController < ApplicationController

before_filter :autorizar, :only => [:index, :show, :edit, :new]

  # GET /trabajos
  # GET /trabajos.xml
  def index
    # Despliega los doctores que aun estan trabajando en la clinica
    # es decir, que aun no tienen fecha de salida en la relacion entre doctor-clinica
    @clinicas = Clinica.find(:all)
    if (@clinicas == nil) # Por si no existen aun trabajos en la clinica
      @trabajos = Trabajo.find(:all)
    else
      @clinica = Clinica.find(Usuario.find(session[:usuario_id]).datos_id)
      @trabajos = Trabajo.find_by_clinica_id(@clinica.id)
      @doctors = @clinica.doctors.find(:all, :conditions => "salida IS NULL")
    end
    @cont = 0

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @trabajos }
    end
  end

  # GET /trabajos/1
  # GET /trabajos/1.xml
  def show
    @trabajo = Trabajo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @trabajo }
    end
  end

  def datos
    #@doctor = Doctor.find()
    #@usuario =

  end

  # GET /trabajos/new
  # GET /trabajos/new.xml
  def new
    @trabajo = Trabajo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @trabajo }
    end
  end

  # GET /trabajos/1/edit
  def edit
    @trabajo = Trabajo.find(params[:id])
  end

  # POST /trabajos
  # POST /trabajos.xml
  def create
    @trabajo = Trabajo.new(params[:trabajo])

    respond_to do |format|
      if @trabajo.save
        flash[:notice] = 'Trabajo was successfully created.'
        format.html { redirect_to(@trabajo) }
        format.xml  { render :xml => @trabajo, :status => :created, :location => @trabajo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @trabajo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /trabajos/1
  # PUT /trabajos/1.xml
  def update
    @trabajo = Trabajo.find(params[:id])

    respond_to do |format|
      if @trabajo.update_attributes(params[:trabajo])
        flash[:notice] = 'Trabajo was successfully updated.'
        format.html { redirect_to(@trabajo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @trabajo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trabajos/1
  # DELETE /trabajos/1.xml
  def destroy
    @trabajo = Trabajo.find(params[:id])
    @trabajo.salida = Time.now
    @trabajo.save

    respond_to do |format|
      format.html { redirect_to(trabajos_url) }
      format.xml  { head :ok }
    end
  end
end

