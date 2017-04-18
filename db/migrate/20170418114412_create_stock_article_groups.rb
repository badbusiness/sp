class CreateStockArticleGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :stock_article_groups do |t|
      t.string :name
      t.decimal :markup

      t.timestamps
    end
  end
end
