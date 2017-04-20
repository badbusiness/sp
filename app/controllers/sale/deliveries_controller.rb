class Sale::DeliveriesController < ApplicationController
  def new
    @order = Order.find(params[:id])
  end
end
