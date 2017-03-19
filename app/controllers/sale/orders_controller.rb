module Sale
  class OrdersController < ApplicationController

    def index
      @orders = Sale::Order.includes(:Customer).all.reverse
    end

    def new
      @order = Sale::Order.new
    end

    
    def show
      @order = Sale::Order.find(params[:id])      
    end
    
    ## Hieronder nog aanpassen voor verkoop
    
    def create
      @order = Sale::Order.new(order_params)
      if @order.save
        redirect_to edit_sale_order_path(@order), notice: 'Order was successfully created.'
      else
        flash[:notice] = @order.errors.full_messages << @order.inspect
        render :new
      end
    end
    
    def edit
      @order = Sale::Order.find(params[:id])  
      #@order_lines = @order.order_lines
    end
    
    def update
      @order = Sale::Order.find_by_id(params[:id])
      if @order.update(order_params)
        redirect_to edit_sale_order_path(@order), notice: "Order is geupdate"
      else
        render :edit, notice: "het ging niet goed"
      end
    end
    
    private
    

    def order_params
      params.require(:sale_order).permit(:Customer_id)
    end
    
  end
end

