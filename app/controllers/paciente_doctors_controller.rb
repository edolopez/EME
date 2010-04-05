class PacienteDoctorsController < ApplicationController
  # GET /paciente_doctors
  # GET /paciente_doctors.xml
  def index
    @paciente_doctors = PacienteDoctor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @paciente_doctors }
    end
  end

  # GET /paciente_doctors/1
  # GET /paciente_doctors/1.xml
  def show
    @paciente_doctor = PacienteDoctor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @paciente_doctor }
    end
  end

  # GET /paciente_doctors/new
  # GET /paciente_doctors/new.xml
  def new
    @paciente_doctor = PacienteDoctor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @paciente_doctor }
    end
  end

  # GET /paciente_doctors/1/edit
  def edit
    @paciente_doctor = PacienteDoctor.find(params[:id])
  end

  # POST /paciente_doctors
  # POST /paciente_doctors.xml
  def create
    @paciente_doctor = PacienteDoctor.new(params[:paciente_doctor])

    respond_to do |format|
      if @paciente_doctor.save
        flash[:notice] = 'PacienteDoctor was successfully created.'
        format.html { redirect_to(@paciente_doctor) }
        format.xml  { render :xml => @paciente_doctor, :status => :created, :location => @paciente_doctor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @paciente_doctor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /paciente_doctors/1
  # PUT /paciente_doctors/1.xml
  def update
    @paciente_doctor = PacienteDoctor.find(params[:id])

    respond_to do |format|
      if @paciente_doctor.update_attributes(params[:paciente_doctor])
        flash[:notice] = 'PacienteDoctor was successfully updated.'
        format.html { redirect_to(@paciente_doctor) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @paciente_doctor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /paciente_doctors/1
  # DELETE /paciente_doctors/1.xml
  def destroy
    @paciente_doctor = PacienteDoctor.find(params[:id])
    @paciente_doctor.destroy

    respond_to do |format|
      format.html { redirect_to(paciente_doctors_url) }
      format.xml  { head :ok }
    end
  end
end
