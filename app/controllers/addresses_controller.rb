class AddressesController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: current_user.addresses, status: :ok
  end

  def create
    @address = current_user.addresses.build(address_params)

    if @address.save
      render json: @address, status: :created, location: @address
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @address = Address.find(params[:id])
    if @address.destroy
      render json: { message: 'Address successfully deleted' }, status: :ok
    else
      render json: { message: 'You can\'t delete this address' }, status: :unprocessable_entity
    end
  end

  def update
    @address = Address.find(params[:id])

    if @address.update(address_params)
      render json: @address, status: :ok
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.permit(:street, :external_number, :internal_number, :postal_code, :colony, :municipality, :city, :state, :country)
  end
end
