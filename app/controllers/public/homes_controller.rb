class Public::HomesController < ApplicationController
  def top
    @items = Item.where(sale_status: false).order(created_at: :desc).limit(4)
  end

  def about
  end
end
