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
      @supplier = Purchase::Supplier.new(name: params[:purchase_supplier][:name])
      respond_to do |format|
        if @supplier.save
          format.html { redirect_to @supplier, notice: 'Supplier was successfully created.' }
          format.json { render :show, status: :created, location: @supplier }
        else
          format.html { render :new }
          format.json { render json: @supplier.errors, status: :unprocessable_entity }
        end
      end
    end
 
    def show
      #@supplier = Purchase::Supplier.find(params[:id])
    end


    ##NOg aanpassen voor klant
    def update_name_from_id
      if @supplier = Purchase::Supplier.find_by_id(params[:supplier_id])
        @supplier_name =  @supplier.name
      else
        @supplier_name = "onbekend"
      end
        
      respond_to do |format|
        format.js
      end
    end  
    
    private
    
    def set_customer
      @customer = Sale::Customer.find(params[:id])
    end
    
  end
end