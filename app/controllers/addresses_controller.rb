class AddressesController < ApplicationController

  def index
    addresses = Address.all
    render json: addresses.to_json, status: 200
  end

  def show
    if Address.exists?(params[:id])
      addresses = Address.find(params[:id])
      render json: addresses.to_json, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end

  def create
    if params[:street_name].nil? || params[:street_name].empty?
      err_msg = "The 'message' parameter was empty or not found"
      render json: { error_msg: err_msg }.to_json, status: 422
    else
      # tweet = Tweet.create(message: params[:message])
      address = Address.new
      address.street_name = params[:street_name]
      address.city = params[:city]
      address.state = params[:state]
      address.zip = params[:zip]
      address.save
      render json: address.to_json, status: 201
    end

  end

  def update
  end

  def destroy
  end
end
