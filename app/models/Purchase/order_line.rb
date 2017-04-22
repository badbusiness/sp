class Purchase::OrderLine < OrderLine
  belongs_to :order
  belongs_to :article, class_name: 'Stock::Article', foreign_key: 'stock_article_id'
  
  def price
    return self.article.purchase_price*amount
  end
end