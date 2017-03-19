module Sale
  class CustomersController < ApplicationController
    before_action :set_customer, only: [:show, :edit, :update, :destroy]

    def index
      @customers = Sale::Customer.all
    end
  
    def new
      @customer = Sale::Customer.new
    end


    ## Hieronder nog aanpassen voor verkoop
    def create
      @customer = Sale::Customer.new(customer_params)
      respond_to do |format|
        if @customer.save
          format.html { redirect_to sale_customers_path, notice: 'Klant aangemaakt!' }
        else
          format.html { render :new }
        end
      end
    end
    
    def edit
      @customer = Sale::Customer.find_by_id(params[:id])
    end

    def update
      @customer = Sale::Customer.find_by_id(params[:id])
      if @customer.update(customer_params)
        redirect_to sale_customers_path, notice: 'klant geupdate!'
      else
        format.html {render :edit}
      end
    end    


    private
    
    def set_customer
      @customer = Sale::Customer.find(params[:id])
    end
    
    def customer_params
      params.require(:sale_customer).permit(:name)
    end
    
  end
end