class Vat < ApplicationRecord
  has_many :articles, class_name: "Stock::Article"
  
  def name_for_select
    "#{description} #{percentage}"
  end
end
