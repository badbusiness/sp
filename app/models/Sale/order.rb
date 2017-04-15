class Sale::Order < Order
  belongs_to :Customer
  has_many :order_lines
  
  accepts_nested_attributes_for :order_lines, :reject_if => :all_blank, :allow_destroy => true
  
  def name_for_select
    "#{id} #{Customer{:name}.name}"
  end
end