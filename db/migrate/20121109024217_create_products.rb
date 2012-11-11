class CreateProducts < ActiveRecord::Migration
  def change
    create_table :product do |t|
      t.string :code, :unique => true, :null => false
      t.string :name, :null => false
      t.text :description
      t.integer :unit_of_measure
      t.decimal :price_per_unit, :null => false

      t.timestamps
    end
  end
end
