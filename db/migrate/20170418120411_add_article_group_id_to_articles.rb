class AddArticleGroupIdToArticles < ActiveRecord::Migration[5.0]
  def change
    add_reference :stock_articles, :stock_article_group, foreign_key: true 
  end
end
