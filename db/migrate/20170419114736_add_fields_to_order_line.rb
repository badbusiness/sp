class AddFieldsToOrderLine < ActiveRecord::Migration[5.0]
  def change
    add_column :order_lines, :article_price, :decimal
    add_column :order_lines, :reduction, :decimal    
    add_reference :order_lines, :vat, index: true
    add_column :orders, :geleverd, :boolean, default: false
    
    
    Vat.create([
      {description: "geen", percentage: "0"},
      {description: "laag", percentage: "0.06"},
      {description: "hoog", percentage: "0.21"}
    ])
    
    
    remove_column :stock_articles, :vat, :float
    add_column :stock_articles, :vat_id, :integer, default: 3
    add_foreign_key :stock_articles, :vat
    
  end
end
