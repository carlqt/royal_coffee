class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :type
      t.string :name
      t.decimal :tall_price
      t.decimal :venti_price
      t.decimal :grande_price
      t.text :description

      t.timestamps null: false
    end
  end
end
