class ProductDecorator < BaseDecorator
  def available_types
    column = []
    column << "Venti" if venti_price
    column << "Tall" if tall_price
    column << "Grande" if grande_price
  end

  def model
    __getobj__
  end
end