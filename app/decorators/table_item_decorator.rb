class TableItemDecorator < BaseDecorator
  def self.merge(collection)
    collection.map do |order_item|
      order_item = new order_item
      OpenStruct.new(quantity: order_item.quantity, price: order_item.price, name: order_item.name, total_price: order_item.total_price)
    end.to_set
  end

  def quantity
    find_similar_item.count
  end

  def total_price
    find_similar_item.sum(:price)
  end

  def find_similar_item
    TableItem.where(table_order_id: table_order_id, product_id: product_id).not_delivered
  end
end