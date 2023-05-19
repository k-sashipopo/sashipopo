class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total_price = current_customer.cart_items.cart_items_total_price(@cart_items)
  end

  def update
    @cart_item = CartItem.find(params[:id])
    
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    #ユーザー登録ないとエラーになる↓
    # @cart_item = current_customer.cart_items.new(cart_item_params) 
    # @cart_item.save
    # redirect_to cart_items_path
    
    if current_customer
      @cart_item = current_customer.cart_items.new(cart_item_params)
    else
      @cart_item = CartItem.new(cart_item_params)
    end
    
    @cart_item.save
    redirect_to cart_items_path
  end


  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :count)
  end
end
