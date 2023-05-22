class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
    #@shipping_addresses = ShippingAddress.all
  end

  def create
  end

  def confirm
    @order=Order.new(order_params)
    if params[:order][:delivery_address] == "0"
       @order.postcode = current_customer.postcode
       @order.address = current_customer.address
       @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:delivery_address]== "1"
       @address = ShippingAddress.find(params[:order][:shipping_address_id])
       @order.post_code = @address.post_code
       @order.shipping_address = @address.shipping_address
       @order.name = @address.name
    end
    # @cart_items = Order.new(order_params)
    # @delivery_address = ShippingAddress.find(params[:order][:address_id])
    
    # @order.delivery_postcode = current_customer.postcode
    # @order.delivery_address = current_customer.shipping_address
    # @order.delivery_name = current_customer.first_name + current_customer.last_name

  end

  def completed
  end

  def index
    @orders = current_customer.orders.all.page(params[:page]).per(10)
  end

  def show
    #@order = Order.find(params[:id])
  end


  private
  def order_params
    params.require(:order).permit(:customer_id, :total_price, :pay_option, :status, :postage, :delivery_name, :delivery_address, :delivery_postcode)
  end
end