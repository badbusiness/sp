class Purchase::OrderLinesController < ApplicationController
  before_action :set_order_line, only: [:show, :edit, :update, :destroy]
  
  def index
    @order_lines = Purchase::OrderLine.all
  end

  def show 
  end

  def edit 
  end

  def update
    respond_to do |format|
      if @purchase_order_line.update(purchase_order_line_params)
        format.html {redirect_to purchase_order_lines_path, notice: "Orderegel aangepast"}
      else
        format.html {render :edit}
      end
    end
  end
  
  
  
  
  def new
    @purchase_order_line = Purchase::OrderLine.new
  end
  
  def create
    @purchase_order_line = Purchase::OrderLine.new(purchase_order_line_params)
    respond_to do |format|
      if @purchase_order_line.save
        format.html {redirect_to @purchase_order_line, notice: "Orderregel aangemaakt"}
        format.json {render :show, status: :created, location: @purchase_order_line}
      else
        format.html {render :new}
      end
    end
  end
  
  
    

  
  private
  
  def set_order_line
    @purchase_order_line = Purchase::OrderLine.find(params[:id])
  end
  
  def purchase_order_line_params
    params.require(:purchase_order_line).permit(:amount, :article_id, :order_id)
  end
  
end

