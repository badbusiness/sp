class Sale::OrderLine < OrderLine
  belongs_to :order
  belongs_to :article, class_name: 'Stock::Article', foreign_key: 'stock_article_id'
  belongs_to :vat
  accepts_nested_attributes_for :vat
  
  before_validation :copy_article_details
   
  def self.copy_all_details
    all.each do |ol|
      ol.copy_article_details
      ol.save
    end
    nil
  end
 
 
  def copy_article_details
    write_attribute(:vat_id, article.vat.id)
    write_attribute(:article_price, article.sale_price)
  end
   
  def amount=(amount)
    newamount = BigDecimal(amount).mult(-1,2)
    write_attribute(:amount, newamount)
  end
  
  def amount
    return self[:amount]*-1 if amount_present?
    return nil
  end
  
  
  ## Display Marge
  def stuksprijs
    regelwaarde / amount
  end
  
  def brutowinst
    stuksprijs - article.purchase_price
  end
  
  def marge
    return brutowinst / stuksprijs if article.present?
  end
  
  def regelwaarde
    return amount*article_price * kortingspercentage if article.present?
  end
  
  def btw
    return regelwaarde*vat.percentage if article.present?
  end
  
  def kortingspercentage
    return 1-reduction/100 if reduction
    return 1
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

