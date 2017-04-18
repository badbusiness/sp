module Stock
  class ArticleGroupsController < ApplicationController
    def index
      @article_groups = ArticleGroup.all
    end

    def new
      @article_group = ArticleGroup.new
    end
    
    def edit
      @article_group = ArticleGroup.find(params[:id])
    end
    
    def update
      @article_group = ArticleGroup.find(params[:id])
      if @article_group.update_attributes(article_group_params)
        redirect_to edit_stock_article_group_path(@article_group), notice: "Geupdate"
      else
        render :edit, notice: "Het ging niet goed"
      end
    end
    
    def show 
      @article_group = ArticleGroup.find(params[:id])
    end

    def create
      @article_group = ArticleGroup.new(article_group_params)
      if @article_group.save
        redirect_to @article_group, notice: "Article was succesfully created"
      else
        render :new
      end
    end
    
    
    private
    def article_group_params
      params.require(:stock_article_group).permit(:name, :markup)
    end
  end
end

