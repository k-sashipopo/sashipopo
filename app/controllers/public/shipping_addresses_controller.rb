class Public::ShippingAddressesController < ApplicationController
  def index
    customer = current_customer
    @shipping_address_new = ShippingAddress.new 
    @shipping_addresses = customer.shipping_addresses.all
  end

  def create
    @shipping_address_new = ShippingAddress.new(shipping_address_params)
    if @shipping_address_new.customer_id = current_customer.id
      @shipping_address_new.save
      redirect_to shipping_addresses_path
    else
      flash[:notice] = "入力に誤りがあります。"
      redirect_to shipping_addresses_path
    end
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def update
    shipping_address = ShippingAddress.find(params[:id])
    shipping_address.update(shipping_address_params)
    redirect_to shipping_addresses_path
  end

  def destroy
    shipping_address = ShippingAddress.find(params[:id])
    shipping_address.destroy
    redirect_to shipping_addresses_path
  end


  private
  def shipping_address_params
    params.require(:shipping_address).permit(:postcode, :address, :name)
  end
end
