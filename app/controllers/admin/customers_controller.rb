class Admin::CustomersController < ApplicationController
   before_action :authenticate_admin!
  def index
    @customers = Customer.page(params[:page])
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
     @customer = Customer.find(params[:id])
  end
  
  def update
      customer = Customer.find(params[:id])
      customer.update(customer_params)
      redirect_to admin_customer_path(customer.id)
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_furigana, :first_furigana, :postal_code, :address, :telephone_number, :email, :customer_status)
  end
end