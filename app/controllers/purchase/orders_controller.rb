module Purchase
  class OrdersController < ApplicationController

    def index
      @orders = Purchase::Order.includes(:Supplier).all.reverse
    end

    def new
      @order = Purchase::Order.new
    end

    
    def show
      @order = Purchase::Order.find(params[:id])      
    end
    
    def create
      @order = Purchase::Order.new(order_params)
      if @order.save
        redirect_to edit_purchase_order_path(@order), notice: 'Order was successfully created.'
      else
        flash[:notice] = @order.errors.full_messages << @order.inspect
        render :new
      end
    end
    
    def edit
      @order = Purchase::Order.find(params[:id])  
      @order_lines = @order.order_lines
    end
    
    def update
      @order = Purchase::Order.find_by_id(params[:id])
      if @order.update(order_params)
        redirect_to edit_purchase_order_path(@order), notice: "Order is geupdate"
      else
        render :edit, notice: "het ging niet goed"
      end
    end
    
    private
    

    def order_params
      params.require(:purchase_order).permit(:Supplier_id)
    end
    
  end
end

