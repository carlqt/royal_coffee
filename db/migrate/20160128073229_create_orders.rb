class CreateOrders < ActiveRecord::Migration
  def change
    create_table :table_orders do |t|
      t.integer :customer_table_id
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
