class BaseDecorator < SimpleDelegator
  def self.wrap(collection)
    collection.map { |obj| new obj }
  end

  def model
    __getobj__
  end
end
