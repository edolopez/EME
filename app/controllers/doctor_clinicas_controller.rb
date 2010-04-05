class DoctorClinicasController < ApplicationController
  # GET /doctor_clinicas
  # GET /doctor_clinicas.xml
  def index
    @doctor_clinicas = DoctorClinica.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @doctor_clinicas }
    end
  end

  # GET /doctor_clinicas/1
  # GET /doctor_clinicas/1.xml
  def show
    @doctor_clinica = DoctorClinica.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @doctor_clinica }
    end
  end

  # GET /doctor_clinicas/new
  # GET /doctor_clinicas/new.xml
  def new
    @doctor_clinica = DoctorClinica.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @doctor_clinica }
    end
  end

  # GET /doctor_clinicas/1/edit
  def edit
    @doctor_clinica = DoctorClinica.find(params[:id])
  end

  # POST /doctor_clinicas
  # POST /doctor_clinicas.xml
  def create
    @doctor_clinica = DoctorClinica.new(params[:doctor_clinica])

    respond_to do |format|
      if @doctor_clinica.save
        flash[:notice] = 'DoctorClinica was successfully created.'
        format.html { redirect_to(@doctor_clinica) }
        format.xml  { render :xml => @doctor_clinica, :status => :created, :location => @doctor_clinica }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @doctor_clinica.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /doctor_clinicas/1
  # PUT /doctor_clinicas/1.xml
  def update
    @doctor_clinica = DoctorClinica.find(params[:id])

    respond_to do |format|
      if @doctor_clinica.update_attributes(params[:doctor_clinica])
        flash[:notice] = 'DoctorClinica was successfully updated.'
        format.html { redirect_to(@doctor_clinica) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @doctor_clinica.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /doctor_clinicas/1
  # DELETE /doctor_clinicas/1.xml
  def destroy
    @doctor_clinica = DoctorClinica.find(params[:id])
    @doctor_clinica.destroy

    respond_to do |format|
      format.html { redirect_to(doctor_clinicas_url) }
      format.xml  { head :ok }
    end
  end
end
