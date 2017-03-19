class Sale::Order < Order
  belongs_to :customer
  has_many :order_lines
end