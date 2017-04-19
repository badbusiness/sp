class Sale::OrderLine < OrderLine
  belongs_to :order
  belongs_to :article, class_name: 'Stock::Article', foreign_key: 'article_id'
  
  def amount=(amount)
    newamount = BigDecimal(amount).mult(-1,2)
    write_attribute(:amount, newamount)
  end
  
  def amount
    return self[:amount]*-1 if amount_present?
    return nil
  end
  
  def regelwaarde
    return amount*article.purchase_price*article.article_group.markup if article.present?
  end
  
  def btw
    return regelwaarde*article.vat.percentage if article.present?
  end
  
 
  def inclusief_btw
    sum_if_article_present(regelwaarde, btw)
  end
  
  private
    
  def sum_if_article_present(field1, field2)
    return field1 + field2 if article_present?
  end
  
  def article_present?
    return true if article
  end
  
  def amount_present?
    return true if self[:amount].present?
  end
    
end

