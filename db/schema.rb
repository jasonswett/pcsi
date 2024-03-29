# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121111161615) do

  create_table "product", :force => true do |t|
    t.string   "code",            :null => false
    t.string   "name",            :null => false
    t.text     "description"
    t.string   "unit_of_measure"
    t.decimal  "price_per_unit",  :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "product_quantity_adjustment", :force => true do |t|
    t.integer  "product_id", :null => false
    t.integer  "quantity",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_foreign_key "product_quantity_adjustment", "product", :name => "product_quantity_adjustment_product_id_fk"

end
