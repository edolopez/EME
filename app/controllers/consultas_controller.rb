class ConsultasController < ApplicationController

before_filter :autorizar, :only => [:new, :show, :edit,:index]

# GET /consultas
  # GET /consultas.xml
  def index
    @consultas = Consulta.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @consultas }
    end
  end

  # GET /consultas/1
  # GET /consultas/1.xml
  def show
    @consulta = Consulta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @consulta }
    end
  end

  # GET /consultas/new
  # GET /consultas/new.xml
  def new
    @consulta = Consulta.new
    #@paciente
    #@doctor

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @consulta }
    end
  end

  # GET /consultas/new
  # GET /consultas/new.xml
  def nuevo(paciente)
    @consulta = Consulta.new
    @paciente = paciente

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @consulta }
    end
 end


  # GET /consultas/1/edit
  def edit
    @consulta = Consulta.find(params[:id])
  end

  # POST /consultas
  # POST /consultas.xml
  def create
    @consulta = Consulta.new(params[:consulta])
    #@paciente
    #@doctor = Doctor.find(Usuario.find(session[:usuario_id]).datos_id)

    respond_to do |format|
      if @consulta.save
        flash[:notice] = 'Consulta was successfully created.'
        format.html { redirect_to(@consulta) }
        format.xml  { render :xml => @consulta, :status => :created, :location => @consulta }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @consulta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /consultas/1
  # PUT /consultas/1.xml
  def update
    @consulta = Consulta.find(params[:id])

    respond_to do |format|
      if @consulta.update_attributes(params[:consulta])
        flash[:notice] = 'Consulta was successfully updated.'
        format.html { redirect_to(@consulta) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @consulta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /consultas/1
  # DELETE /consultas/1.xml
  def destroy
    @consulta = Consulta.find(params[:id])
    @consulta.destroy

    respond_to do |format|
      format.html { redirect_to(consultas_url) }
      format.xml  { head :ok }
    end
  end
end

