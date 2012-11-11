class CreateProductQuantityAdjustment < ActiveRecord::Migration
  def change
    create_table :product_quantity_adjustment do |t|
      t.integer :product_id, :null => false
      t.integer :quantity, :null => false

      t.timestamps
    end

    add_foreign_key(:product_quantity_adjustment, :product)
  end
end
