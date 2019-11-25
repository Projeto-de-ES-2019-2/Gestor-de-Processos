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

ActiveRecord::Schema.define(version: 20191111174622) do

  create_table "advogados", force: :cascade do |t|
    t.string "nome"
    t.string "n_OAB"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_advogados_on_user_id"
  end

  create_table "historicos", force: :cascade do |t|
    t.string "descricao"
    t.integer "processo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["processo_id"], name: "index_historicos_on_processo_id"
  end

  create_table "processos", force: :cascade do |t|
    t.string "cliente"
    t.string "ex_adversa"
    t.string "natureza"
    t.string "assunto"
    t.string "tipo_acao"
    t.string "juizo"
    t.string "num_processo"
    t.date "ultimo_contato_cliente"
    t.date "contato_agendado"
    t.integer "advogado_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advogado_id"], name: "index_processos_on_advogado_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
