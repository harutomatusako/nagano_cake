class Customer::ShippingAddressController < ApplicationController
  def index
    @shipping_address=Address.new
    @shipping_addresses=current_customer.addresses
  end

  def create
    @shipping_address=Address.new(shipping_address_params)
    @shipping_address.customer_id = current_customer.id

    if @shipping_address.save
      redirect_to shipping_address_index_path
    else
      @shipping_addresses=current_customer.addresses
      render :index
    end
  end

  def edit
    @shipping_address = Address.find(params[:id])
      if @shipping_address.customer_id == current_customer.id
        render :edit
      else
        redirect_to shipping_address_index_path
      end
  end

  def update
    shipping_address = Address.find(params[:id])
    shipping_address.update(shipping_address_params)
    redirect_to shipping_address_index_path
  end


  def destroy
    shipping_address = Address.find(params[:id])
    shipping_address.destroy
    redirect_to shipping_address_index_path
  end

private
def shipping_address_params
    params.require(:address).permit(:name, :postal_code, :address,)
end
end
