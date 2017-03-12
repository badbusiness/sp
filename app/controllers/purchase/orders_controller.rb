module Purchase
  class OrdersController < ApplicationController

    def index
      @orders = Purchase::Order.all
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
        redirect_to @order, notice: 'Order was successfully created.'
      else
        flash[:notice] = @order.errors.full_messages << @order.inspect
        render :new
      end
    end
    
    private
    

    def order_params
      params.require(:purchase_order).permit(:Supplier_id)
    end
    
  end
end