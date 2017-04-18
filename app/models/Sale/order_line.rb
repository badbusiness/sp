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
  
  def regelwaarde
    if self.article
      return self.amount*self.article.purchase_price*self.article.article_group.markup
    else
      return nil
    end
  end
  
  def btw
    if self.article
      return self.regelwaarde*self.article.vat
    else
      return nil
    end
  end
  
  def inclusief_btw
    if self.article
      return self.regelwaarde+self.btw
    else
      return nil
    end
  end
  
end

