class Sale::OrderLine < OrderLine
  belongs_to :order
  belongs_to :article, class_name: 'Stock::Article', foreign_key: 'article_id'
  
  def amount=(amount)
    newamount = BigDecimal(amount).mult(-1,2)
    write_attribute(:amount, newamount)
  end
  def amount
    if self[:amount].present?
      return self[:amount]*-1
    end
    nil
  end
end

