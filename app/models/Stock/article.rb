class Stock::Article < ApplicationRecord
  has_many :order_lines, class_name: 'OrderLine', foreign_key: "article_id"
  belongs_to :article_group
  belongs_to :vat
  accepts_nested_attributes_for :article_group
  accepts_nested_attributes_for :vat
  
  
  
  def stock
    self.order_lines.sum(:amount)
  end
  
  def name_for_select
    description + " " + specification
  end
  
  def bruto_prijs
    self.purchase_price*self.article_group.markup
  end
end
