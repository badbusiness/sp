class Sale::OrderLinesController < ApplicationController
  before_action :set_order_line, only: [:show, :edit, :update, :destroy]
  
  def index
    @order_lines = Sale::OrderLine.all
  end

  def show 
  end

  def edit 
  end


  ## Hieronder nog aanpassen voor verkoop
  def update
    respond_to do |format|
      if @order_line.update(sale_order_line_params)
        format.html {redirect_to sale_order_lines_path, notice: "Orderegel aangepast"}
      else
        format.html {render :edit}
      end
    end
  end
  
  
  
  
  def new
    @order_line = Sale::OrderLine.new
  end
  
  def create
    @order_line = Sale::OrderLine.new(sale_order_line_params)
    respond_to do |format|
      if @order_line.save
        format.html {redirect_to sale_order_lines_path, notice: "Orderregel aangemaakt"}
        format.json {render :show, status: :created, location: @order_line}
      else
        format.html {render :new}
      end
    end
  end
  
  
    

  
  private
  
  def set_order_line
    @order_line = Sale::OrderLine.find(params[:id])
  end
  
  def sale_order_line_params
    params.require(:sale_order_line).permit(:amount, :article_id, :order_id)
  end
  
end

