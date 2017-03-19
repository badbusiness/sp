class Sale::Order < Order
  belongs_to :Customer
  has_many :order_lines
end