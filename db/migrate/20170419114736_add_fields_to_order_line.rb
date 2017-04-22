class AddFieldsToOrderLine < ActiveRecord::Migration[5.0]
  def change
    add_column :order_lines, :article_price, :decimal
    add_column :order_lines, :reduction, :decimal    
    add_reference :order_lines, :vat, index: true
    add_column :orders, :geleverd, :boolean, default: false
  end
end
