module Stock
  class ArticlesController < ApplicationController
    def index
      @stock_articles = Stock::Article.all
    end
  
    def show
      @stock_article = Stock::Article.find_by_id(params[:id])
    end
    
    def new
      @stock_article = Stock::Article.new
    end
    
    def create
      @stock_article = Stock::Article.new(article_params)
      respond_to do |format|
        if @stock_article.save
          format.html {redirect_to @stock_article, notice: 'Article was succesfully created.'}
        else
          format.html (render :new )
        end
      end
    end
    
    private
    
    def article_params
      params.require(:stock_article).permit(:number, :description, :specification)
    end
    
    
  end
end