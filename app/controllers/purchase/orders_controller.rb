module Purchase
  class OrdersController < ApplicationController

    def index
      @orders = Purchase::Order.includes(:Supplier).all.reverse
    end

    def new
      @order = Purchase::Order.new
      @order.order_lines.build
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
      @order.order_lines.build
    end
    
    def update
      @order = Purchase::Order.find(params[:id])
      if @order.update_attributes(order_params)
        redirect_to edit_purchase_order_path(@order), notice: "Order is geupdate"
      else
        render :edit, notice: "het ging niet goed"
      end
    end
    
    private
    

    def order_params
      params.require(:purchase_order).permit! #(
        #:Supplier_id,
       # purchase_order_line_attributes: [:id, :_destroy, :article_id, :amount]
      #)
    end
    
  end
end

