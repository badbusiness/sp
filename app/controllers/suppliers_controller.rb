class SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.all
  end
  

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(name: params[:supplier][:name])

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
    @supplier = Supplier.find(params[:id])
  end
end
