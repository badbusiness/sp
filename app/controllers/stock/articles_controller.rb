module Stock
class ArticlesController < ApplicationController
  def index
    @stock_articles = Stock::Article.all
  end
  
  def show
    @stock_article = Stock::Article.find_by_id(params[:id])
  end
end
end