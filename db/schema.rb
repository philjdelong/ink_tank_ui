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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2020_02_26_181019) do
=======
ActiveRecord::Schema.define(version: 2020_02_26_043933) do
>>>>>>> 3d73be17506c1eba587ee054a27e000ec900c788

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
  create_table "payments", force: :cascade do |t|
    t.string "name"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "phone_number"
    t.string "status"
    t.string "amount"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_payments_on_user_id"
=======
  create_table "appointments", force: :cascade do |t|
    t.datetime "date"
    t.string "description"
    t.boolean "paid"
    t.string "client_name"
    t.string "client_email"
    t.bigint "artist_id"
    t.index ["artist_id"], name: "index_appointments_on_artist_id"
>>>>>>> 3d73be17506c1eba587ee054a27e000ec900c788
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "street_address"
    t.string "city"
    t.string "zip"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end


  create_table "artist_styles", force: :cascade do |t|
    t.bigint "artist_id"
    t.bigint "style_id"
    t.index ["artist_id"], name: "index_artist_styles_on_artist_id"
    t.index ["style_id"], name: "index_artist_styles_on_style_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.float "price_per_hour"
    t.string "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shop_id"
    t.string "uid"
    t.string "login"
    t.string "token"
    t.string "image"
    t.index ["shop_id"], name: "index_artists_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "street_address"
    t.string "city"
    t.string "zip"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "styles", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

<<<<<<< HEAD
  add_foreign_key "payments", "users"
  add_foreign_key "users", "shops"
=======
  add_foreign_key "appointments", "artists"
  add_foreign_key "artist_styles", "artists"
  add_foreign_key "artist_styles", "styles"
  add_foreign_key "artists", "shops"
>>>>>>> 3d73be17506c1eba587ee054a27e000ec900c788
end
