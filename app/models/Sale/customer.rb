class Sale::Customer < Relation
  has_many :orders
end