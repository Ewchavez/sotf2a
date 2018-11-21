# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181120230627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administradors", force: :cascade do |t|
    t.string   "foto"
    t.string   "log"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "usuario_id"
    t.index ["usuario_id"], name: "index_administradors_on_usuario_id", using: :btree
  end

  create_table "alumnos", force: :cascade do |t|
    t.integer  "recorda"
    t.integer  "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "usuario_id"
    t.index ["usuario_id"], name: "index_alumnos_on_usuario_id", using: :btree
  end

  create_table "asesors", force: :cascade do |t|
    t.integer  "dia"
    t.integer  "mes"
    t.integer  "ano"
    t.integer  "horai"
    t.integer  "horaf"
    t.string   "lugar"
    t.string   "ubicacion"
    t.integer  "codl"
    t.integer  "disponibilidada"
    t.integer  "atendido"
    t.integer  "nivelusuario"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "seccion_id"
    t.date     "fecha"
    t.string   "semana"
    t.index ["seccion_id"], name: "index_asesors_on_seccion_id", using: :btree
  end

  create_table "carreras", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "facultad_id"
    t.index ["facultad_id"], name: "index_carreras_on_facultad_id", using: :btree
  end

  create_table "carrxcurs", force: :cascade do |t|
    t.integer  "idcarrera"
    t.integer  "idcurso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chats", force: :cascade do |t|
    t.integer  "origen"
    t.integer  "destino"
    t.integer  "channel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "citars", force: :cascade do |t|
    t.integer  "dia"
    t.integer  "mes"
    t.integer  "ano"
    t.string   "tema"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "asesor_id"
    t.integer  "alumno_id"
    t.date     "fecha"
    t.string   "resumen"
    t.string   "reporte"
    t.integer  "profesorid"
    t.string   "semana"
    t.integer  "calumno"
    t.integer  "cprofesor"
    t.index ["alumno_id"], name: "index_citars_on_alumno_id", using: :btree
    t.index ["asesor_id"], name: "index_citars_on_asesor_id", using: :btree
  end

  create_table "cursos", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "creditos"
    t.integer  "nivel"
    t.integer  "nivelusuario"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "carrera_id"
    t.index ["carrera_id"], name: "index_cursos_on_carrera_id", using: :btree
  end

  create_table "facultads", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "grupo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "origen"
    t.integer  "destino"
  end

  create_table "profesors", force: :cascade do |t|
    t.string   "especialidad"
    t.integer  "estado"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "usuario_id"
    t.index ["usuario_id"], name: "index_profesors_on_usuario_id", using: :btree
  end

  create_table "seccions", force: :cascade do |t|
    t.integer  "capacidad"
    t.integer  "idsec"
    t.integer  "estado"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "profesor_id"
    t.integer  "semestre_id"
    t.integer  "curso_id"
    t.index ["curso_id"], name: "index_seccions_on_curso_id", using: :btree
    t.index ["profesor_id"], name: "index_seccions_on_profesor_id", using: :btree
    t.index ["semestre_id"], name: "index_seccions_on_semestre_id", using: :btree
  end

  create_table "semestres", force: :cascade do |t|
    t.string   "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "nombre"
    t.string   "contrasena"
    t.string   "email"
    t.integer  "codigo"
    t.integer  "nivelu"
    t.integer  "activo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "administradors", "usuarios"
  add_foreign_key "alumnos", "usuarios"
  add_foreign_key "asesors", "seccions"
  add_foreign_key "carreras", "facultads"
  add_foreign_key "citars", "alumnos"
  add_foreign_key "citars", "asesors"
  add_foreign_key "cursos", "carreras"
  add_foreign_key "profesors", "usuarios"
  add_foreign_key "seccions", "cursos"
  add_foreign_key "seccions", "profesors"
  add_foreign_key "seccions", "semestres"
end
