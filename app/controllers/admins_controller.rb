class AdminsController < ApplicationController

before_filter :autorizar, :only => [:show, :edit, :datos, :update, :destroy]

# GET /admins
  # GET /admins.xml

  def index

    @admins = Admin.all
    @usuarios = Usuario.find(:all, :conditions => "datos_type = 'Admin'")
    @cont = 0

  end

  # GET /admins/1
  # GET /admins/1.xml
  def show

@admin = Admin.find(params[:id])
id = @admin.id
@usuario = Usuario.find_by_datos_id(id, :conditions => "datos_type = 'Admin'")

  end

  # GET /admins/new
  # GET /admins/new.xml
  def new

    @admin = Admin.new
    @usuario = Usuario.new

  end

  # GET /admins/1/edit
  def edit

@admin = Admin.find(params[:id])
id = @admin.id
@usuario = Usuario.find_by_datos_id(id, :conditions => "datos_type = 'Admin'")

  end

  # POST /admins
  # POST /admins.xml
  def create
    @admin = Admin.new(params[:admin])
    @usuario = Usuario.new(params[:usuario])
		@usuario.datos = @admin

    respond_to do |format|
      if @admin.valid? && @usuario.valid?
        @admin.save
        @usuario.save
        flash[:notice] = 'Administrador Creado.'
        format.html { redirect_to admins_path }
        format.xml  { render :xml => @admin, :status => :created, :location => @admin }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @admin.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admins/1
  # PUT /admins/1.xml
  def update
       @admin = Admin.find(Usuario.find(session[:usuario_id]).datos_id)
		@usuario = Usuario.find(session[:usuario_id])

    respond_to do |format|
      if @admin.valid? && @usuario.valid?
				@admin.update_attributes(params[:admin])
				@usuario.update_attributes(params[:usuario])
        flash[:notice] = 'Admin was successfully updated.'
        format.html { redirect_to :back }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @admin.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.xml
  def destroy
    @admin = Admin.find(params[:id])
		    id = @admin.id
    @usuario = Usuario.find_by_datos_id(id, :conditions => "datos_type = 'Admin'")

    @admin.destroy
		@usuario.destroy

    respond_to do |format|
      format.html { redirect_to(admins_url) }
      format.xml  { head :ok }
    end
  end

def datos

	@admin = Admin.find(params[:id])
    id = @admin.id
  @usuario = Usuario.find_by_datos_id(id, :conditions => "datos_type = 'Admin'")

end

end

