class Vat < ApplicationRecord
  has_many :articles, class_name: "Stock::Articles"
  
  def name_for_select
    "#{description} #{percentage}"
  end
end
