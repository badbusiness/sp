class Stock::Article < ApplicationRecord
  has_many :order_lines, class_name: 'OrderLine', foreign_key: "article_id"
  
  def stock
    self.order_lines.sum(:amount)
  end
end
