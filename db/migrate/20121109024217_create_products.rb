class CreateProducts < ActiveRecord::Migration
  def change
    create_table :product do |t|
      t.string :code, :unique => true, :null => false
      t.string :name, :null => false
      t.text :description, :null => false
      t.integer :unit_of_measure, :null => false
      t.decimal :price_per_unit, :null => false

      t.timestamps
    end
  end
end
