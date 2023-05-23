class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def create
    #@customer = current_customer
    @order = current_customer.orders.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items.all
    @total_price = @postage #合計金額の計算

    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new #初期化宣言
      @order_details.order_id = @order.id
      @order_details.item_id = cart_item.item.id
      @order_details.count = cart_item.count
      @order_details.with_tax_price = cart_item.item.with_tax_price
      @order_details.save
    end
      redirect_to completed_orders_path #注文完了ページに遷移
      current_customer.cart_items.destroy_all #カートの中身を削除
  end

  def confirm #配送先選択
    @order = Order.new(order_params)
    @postage = 400
    if params[:order][:select_address] == "0"
      @order.delivery_postcode = current_customer.postcode
      @order.delivery_address = current_customer.address
      @order.delivery_name = current_customer.first_name + " " + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @shipping_address = ShippingAddress.find(params[:order][:shipping_addresses_id])
      @order.delivery_postcode =  @shipping_address.postcode
      @order.delivery_address =  @shipping_address.address
      @order.delivery_name =  @shipping_address.name
    elsif params[:order][:select_address] == "2"
      @order.delivery_postcode = params[:order][:postcode]
      @order.delivery_address = params[:order][:address]
      @order.delivery_name = params[:order][:name]
    end
      @cart_items = current_customer.cart_items
      @order_new = Order.new
      render :confirm
  end

  def completed
  end

  def index
    @orders = current_customer.orders.all.page(params[:page]).per(10)
  end

  def show
    # @order = Order.find(params[:id])
  end


  private
  def order_params
    params.require(:order).permit(:customer_id, :total_price, :pay_option, :status, :postage, :delivery_name, :delivery_address, :delivery_postcode)
  end

end