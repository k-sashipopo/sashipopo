class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @genre = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item)
  end

  def show
    @item = Item.find(params[:id])

  end

  def edit
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:name, :intro, :tax_free_price, :sale_status, :genre_id, :image)
  end

end
