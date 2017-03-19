class Purchase::Supplier < Relation
  has_many :Orders
end