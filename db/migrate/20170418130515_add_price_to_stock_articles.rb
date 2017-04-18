class AddPriceToStockArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :stock_articles, :purchase_price, :decimal, default: "0.0"
    add_column :stock_articles, :unit, :string
    add_column :stock_articles, :vat, :float, default: "0.21"
  end
end
