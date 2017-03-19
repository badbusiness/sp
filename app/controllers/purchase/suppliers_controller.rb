module Purchase
  class SuppliersController < ApplicationController
    before_action :set_supplier, only: [:show, :edit, :update, :destroy]

    def index
      @purchase_suppliers = Purchase::Supplier.all
    end
  
    def new
      @supplier = Purchase::Supplier.new
    end

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
    
    def set_supplier
      @supplier = Purchase::Supplier.find(params[:id])
    end
    
  end
end