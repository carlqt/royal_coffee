class CreateCustomerTables < ActiveRecord::Migration
  def change
    create_table :customer_tables do |t|
      t.integer :number

      t.timestamps null: false
    end
  end
end
