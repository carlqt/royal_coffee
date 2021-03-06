# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  drink_type   :integer
#  name         :string
#  tall_price   :decimal(, )
#  venti_price  :decimal(, )
#  grande_price :decimal(, )
#  description  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  deleted_at   :datetime
#

class Product < ActiveRecord::Base
  acts_as_paranoid

  validates :venti_price, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :grande_price, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :tall_price, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  enum drink_type: { coffee: 0, tea: 1 }

  scope :by_drink_type, ->(type) { where(drink_type: type) }
  scope :by_size, ->(size) { where.not("#{size}" => nil) }

  def self.available_sizes
    column_names.select{ |name| name.match("price") }
  end
end
