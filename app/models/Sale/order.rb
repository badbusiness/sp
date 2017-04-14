class Sale::Order < Order
  belongs_to :Customer
  has_many :order_lines
  
  def name_for_select
    "#{id} #{Customer{:name}.name}"
  end
end