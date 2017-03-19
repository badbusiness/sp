class Sale::OrderLine < OrderLine
  belongs_to :order
  belongs_to :article, class_name: 'Stock::Article', foreign_key: 'article_id'
  
  def amount=(amount)
    @amount = amount * -1
  end
  def amount
    @amount*-1
  end
end