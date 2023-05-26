class Admin::OrderDetailsController < ApplicationController 
def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      flash[:success] = "製作ステータスを更新しました。"
      redirect_to admin_order_path(@order_detail.order)
    else
      flash[:error] = "製作ステータスの更新に失敗しました。"
      redirect_to admin_order_path(@order_detail.order)
    end
  end
def update
  @order_detail = OrderDetail.find(params[:id])
  @order = @order_detail.order
  if @order_detail.update(order_detail_params)
    if @order_detail. work_status== "manufacturing"
      @order.update(status: "in_production")
    elsif @order.order_details.all? { |detail| detail.work_status == "finish" }
      @order.update(status: "preparing_to_shi")
    end
    flash[:success] = "製作ステータスを更新しました。"
    redirect_to admin_order_path(@order_detail.order)
  else
    flash[:error] = "製作ステータスの更新に失敗しました。"
    redirect_to admin_order_path(@order_detail.order)
  end
end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end

end