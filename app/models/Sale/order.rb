class Sale::Order < Order
  belongs_to :Customer
  has_many :order_lines
  
  accepts_nested_attributes_for :order_lines, :reject_if => :all_blank, :allow_destroy => true
  
  def name_for_select
    "#{id} #{Customer{:name}.name}"
  end
  
  def totaalprijs
    counter = 0
    self.order_lines.each do |ol|
      if ol.article
        counter += ol.regelwaarde
      end
    end
    counter
  end
  
  def btw
    counter = 0 
    self.order_lines.each do |ol|
      if ol.btw
        counter += ol.btw
      end
    end
    counter
  end
  
  def inclusief_btw
    counter = 0
    self.order_lines.each do |ol|
      if ol.inclusief_btw
        counter += ol.inclusief_btw
      end
    end
    counter
  end
  
end