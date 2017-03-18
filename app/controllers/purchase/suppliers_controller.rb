module Purchase
  class SuppliersController < ApplicationController

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
      @supplier = Purchase::Supplier.find(params[:supplier_id])
    end

    def update_name_from_id
      @supplier_name = Purchase::Supplier.find_by_id(params[:supplier_id]).name
      respond_to do |format|
        format.js
      end
    end  
  end
end