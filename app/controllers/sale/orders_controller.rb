module Sale
  class OrdersController < ApplicationController

    def index
      case params[:filter]
      when "all"
        @orders = Sale::Order.includes(:Customer).reverse
      when "geleverd"
        @orders = Sale::Order.includes(:Customer).where(geleverd: true, gefactureerd: false)
      when "gefactureerd"        
        @orders = Sale::Order.includes(:Customer).where(gefactureerd: true)
      else
        @orders = Sale::Order.includes(:Customer).open.reverse
      end
    end

    def new
      @order = Sale::Order.new
      @order_lines = @order.order_lines.new
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
      @order = Purchase::Order.find(params[:id])  
      @order.order_lines.build
    end
    
    def edit
      @order = Sale::Order.find(params[:id])  
      @order.order_lines.build
    end
    
    def update
      @order = Sale::Order.find_by_id(params[:id])
      if @order.update_attributes(order_params)
        redirect_to edit_sale_order_path(@order), notice: "Order is geupdate"
      else
        render :edit, notice: "het ging niet goed"
      end
    end
        
    private
    
    def order_params
      params.require(:sale_order).permit!
      #(:Customer_id,
      #  order_lines_attributes: [:id, :_destroy, :article_id, :amount]
      #)
    end
    
  end
end

