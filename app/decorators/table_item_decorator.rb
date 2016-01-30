class TableItemDecorator < BaseDecorator
  def self.merge(collection)
    @@collection = new collection
    wrap(collection).map do |order_item|
      OpenStruct.new(quantity: order_item.quantity, price: order_item.price, name: order_item.displayed_name, total_price: order_item.total_price)
    end.to_set
  end

  def quantity
    self.find_similar_item.count
  end

  def total_price
    self.find_similar_item.sum(:price)
  end

  def displayed_name
    "#{name} - #{size[0].upcase}"
  end

  def find_similar_item
    @@collection.where(table_order_id: table_order_id, product_id: product_id, size: size)
  end

end