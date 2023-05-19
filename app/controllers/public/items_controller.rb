class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @items_page = Item.all.page(params[:page]).per(4).reverse_order
  end

  def show
    @item = Item.find(params[:id])
    #@genres = Genre.all
    @cart_item = CartItem
  end
  
  
  private
  
  def item_params
    params.require(:items).permit(:genre_id, :name, :tax_free_price, :intro, :sale_status)
  end
  
end
