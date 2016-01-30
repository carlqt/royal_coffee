class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :table_items do |t|
      t.string :size
      t.decimal :price
      t.integer :drink_type
      t.integer :table_order_id
      t.integer :product_id
      t.string :name
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
