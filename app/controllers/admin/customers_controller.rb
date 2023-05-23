class Admin::CustomersController < ApplicationController
   before_action :authenticate_admin!
  def index
    @customers = Customer.page(params[:page])
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
  end
  
  def update
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_furigana, :first_furigana, :postal_code, :address, :telephone_number, :email, :is_deleted)
  end
end