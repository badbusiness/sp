class Purchase::Order < Order
  belongs_to :Supplier
  has_many :order_lines
end