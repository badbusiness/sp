class Purchase::Order < Order
  belongs_to :Supplier
  has_many :order_lines
  
  accepts_nested_attributes_for :order_lines, :reject_if => :all_blank, :allow_destroy => true
   
  
end