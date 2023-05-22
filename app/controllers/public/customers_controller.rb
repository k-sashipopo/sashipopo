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
  end

  def resign
  end

private

def customer_params
 params.require(:customer).permit(:first_name, :last_name, :kana_fitst_name, :kana_last_name, :postcode, :address, :telephone_number, :email)
end
end
