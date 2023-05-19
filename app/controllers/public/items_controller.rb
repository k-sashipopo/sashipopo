class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(8).reverse_order
    #@genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    #@genres = Genre.all
    @cart_item = CartItem.new
  end
  
  
  private
  
  def item_params
    params.require(:items).permit(:genre_id, :name, :tax_free_price, :intro, :sale_status)
  end
end
