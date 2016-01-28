class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customer_table_id
      t.string :order_item_id

      t.timestamps null: false
    end
  end
end
