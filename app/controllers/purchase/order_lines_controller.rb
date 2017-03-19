class Purchase::OrderLinesController < ApplicationController
  before_action :set_order_line, only: [:show, :edit, :update, :destroy]
  
  def index
    @order_lines = Purchase::OrderLine.all
  end

  def show
  end
  
  def new
    @purchase_order_line = Purchase::OrderLine.new
  end
  
  def create
    @purchase_order_line = Purchase::OrderLine.new(order_line_params)
    respond_to do |format|
      if @purchase_order_line.save
        format.html {redirect_to @purchase_order_line, notice: "Orderregel aangemaakt"}
        format.json {render :show, status: :created, location: @purchase_order_line}
      else
        format.html {render :new}
      end
    end
  end
  
  def set_order_line
    @purchase_order_line = Purchase::OrderLine.find(params[:id])
  end
  
  def order_line_params
    params.require(:purchase_order_line).permit(:amount, :article_id, :order_id)
  end
  
end

