class Public::CustomersController < ApplicationController
  def show
    @customer=current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to root_path
  end

  def confirm
    # @customer = Customer.find_by(email: params[:customer][:email])
  end

  def resign
    @customer= Customer.find(params[:id])
    @customer.update(customer_status: true)
    reset_session
    # flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

private

def customer_params
 params.require(:customer).permit(:first_name, :last_name, :kana_fitst_name, :kana_last_name, :postcode, :address, :telephone_number, :email)
end
end
