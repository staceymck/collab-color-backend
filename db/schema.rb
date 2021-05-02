# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_30_185322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "canvases", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "colored_polygons", force: :cascade do |t|
    t.bigint "painting_id", null: false
    t.bigint "polygon_id", null: false
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["painting_id"], name: "index_colored_polygons_on_painting_id"
    t.index ["polygon_id"], name: "index_colored_polygons_on_polygon_id"
  end

  create_table "paintings", force: :cascade do |t|
    t.bigint "canvas_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["canvas_id"], name: "index_paintings_on_canvas_id"
  end

  create_table "polygons", force: :cascade do |t|
    t.bigint "canvas_id", null: false
    t.string "points", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["canvas_id"], name: "index_polygons_on_canvas_id"
  end

  add_foreign_key "colored_polygons", "paintings"
  add_foreign_key "colored_polygons", "polygons"
  add_foreign_key "paintings", "canvases"
  add_foreign_key "polygons", "canvases"
end
