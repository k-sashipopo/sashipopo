class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
    @genre = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @genre = Genre.all
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      flash[:notice] = "入力に誤りがあります。"
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genre = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    @genre = Genre.all
    if @item.update(item_params)
      redirect_to admin_item_path(@item.id)
    else
      flash[:notice] = "入力に誤りがあります。"
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :intro, :tax_free_price, :sale_status, :genre_id, :image)
  end

end
