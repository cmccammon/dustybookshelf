class ItemsController < ApplicationController
  def index
    items = Item.all
    render json: items.to_json, status: 200
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
      err_msg = "The 'street_name' parameter was empty or not found"
      render json: { error_msg: err_msg }.to_json, status: 422
    else
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
    if address.exists?(params[:id])
      address = Address.find(params[:id])
      address.street_name = params[:street_name]
      address.city = params[:city]
      address.state = params[:state]
      address.zip = params[:zip]
      address.save
      render json: address.to_json, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end

  def destroy
    if Address.exists?(params[:id])
      address = Address.find(params[:id])
      address.destroy
      render json: { message: "Address record Deleted Successfully." }, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end
end
