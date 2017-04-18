class Stock::Article < ApplicationRecord
  has_many :order_lines, class_name: 'OrderLine', foreign_key: "article_id"
  belongs_to :article_group
  accepts_nested_attributes_for :article_group
  
  
  def stock
    self.order_lines.sum(:amount)
  end
  
  def name_for_select
    description + " " + specification
  end
end
