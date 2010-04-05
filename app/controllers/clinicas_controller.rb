class ClinicasController < ApplicationController
  # GET /clinicas
  # GET /clinicas.xml
  def index
    @clinicas = Clinica.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @clinicas }
    end
  end

  # GET /clinicas/1
  # GET /clinicas/1.xml
  def show
    @clinica = Clinica.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @clinica }
    end
  end

  # GET /clinicas/new
  # GET /clinicas/new.xml
  def new
    @clinica = Clinica.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @clinica }
    end
  end

  # GET /clinicas/1/edit
  def edit
    @clinica = Clinica.find(params[:id])
  end

  # POST /clinicas
  # POST /clinicas.xml
  def create
    @clinica = Clinica.new(params[:clinica])

    respond_to do |format|
      if @clinica.save
        flash[:notice] = 'Clinica was successfully created.'
        format.html { redirect_to(@clinica) }
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

    respond_to do |format|
      if @clinica.update_attributes(params[:clinica])
        flash[:notice] = 'Clinica was successfully updated.'
        format.html { redirect_to(@clinica) }
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
    @clinica.destroy

    respond_to do |format|
      format.html { redirect_to(clinicas_url) }
      format.xml  { head :ok }
    end
  end
end
