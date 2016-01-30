class ProductDecorator < BaseDecorator
  def available_types
    column = []
    column << "venti" if venti_price
    column << "tall" if tall_price
    column << "grande" if grande_price
  end

  def model
    __getobj__
  end

  def displayed_price
    price = model.send("#{available_types.first}_price")
    "$%.2f" % price
  end

  def self.wrap(collection)
    collection.map { |obj| new obj }
  end
end