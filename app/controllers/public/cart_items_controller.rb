class Public::CartItemsController < ApplicationController
  def index
    #会員登録機能追加後に変更予定
    if current_customer
      @cart_items = current_customer.cart_items
      @total_price = current_customer.cart_items.cart_items_total_price(@cart_items)
    else
      @cart_items = CartItem.all
      @total_price = calculate_total_price(@cart_items)
    end
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
  #  current_customer.cart_items.destroy_all
    cart_items = CartItem.all
    cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    #ユーザー登録ないとエラーになる↓
    # @cart_item = current_customer.cart_items.new(cart_item_params) 
    # @cart_item.save
    # redirect_to cart_items_path

    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      redirect_to cart_items_path
    else
      # 保存に失敗した場合の処理
      redirect_to items_path
    end
  end


  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :count)
  end
  
  # 合計金額のメソッド
  def calculate_total_price(items)
    total_price = 0
    items.each do |item|
      total_price += item.subtotal
    end
    total_price
  end
end
