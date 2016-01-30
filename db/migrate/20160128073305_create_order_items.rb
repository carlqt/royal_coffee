class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :table_items do |t|
      t.integer :quantity
      t.decimal :price
      t.integer :drink_type
      t.integer :table_order_id
      t.integer :product_id
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
