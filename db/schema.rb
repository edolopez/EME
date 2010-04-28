# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100418080713) do

  create_table "clinicas", :force => true do |t|
    t.string   "rfc"
    t.string   "ciudad"
    t.string   "estado"
    t.string   "calle"
    t.string   "colonia"
    t.string   "codigoPostal"
    t.string   "fax"
    t.string   "tipoClinica"
    t.string   "especialidad"
    t.string   "sitioWeb"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "doctors", :force => true do |t|
    t.string   "apellidoPaterno"
    t.string   "apellidoMaterno"
    t.integer  "edad"
    t.string   "sexo"
    t.date     "fechaNacimiento"
    t.string   "ciudadNacimiento"
    t.string   "estadoNacimiento"
    t.string   "especialidad"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pacientes", :force => true do |t|
    t.string   "apellidoPaterno"
    t.string   "apellidoMaterno"
    t.integer  "edad"
    t.string   "sexo"
    t.date     "fechaNacimiento"
    t.string   "ciudadNacimiento"
    t.string   "estadoNacimiento"
    t.string   "estadoCivil"
    t.integer  "estatura",          :limit => 10, :precision => 10, :scale => 0
    t.string   "tipoSangre"
    t.boolean  "tatuajes"
    t.string   "religion"
    t.integer  "peso",              :limit => 10, :precision => 10, :scale => 0
    t.string   "preferenciaSexual"
    t.string   "ocupacion"
    t.string   "companiaSeguros"
    t.string   "poliza"
    t.integer  "expediente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trabajos", :force => true do |t|
    t.integer  "doctor_id"
    t.integer  "clinica_id"
    t.date     "salida"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "nombre"
    t.string   "correoElectronico"
    t.string   "telefono"
    t.string   "hashed_password"
    t.string   "salt"
    t.integer  "datos_id"
    t.string   "datos_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imagen_file_name"
    t.string   "imagen_content_type"
    t.integer  "imagen_file_size"
    t.datetime "imagen_updated_at"
  end

end
