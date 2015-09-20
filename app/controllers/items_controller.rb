class ItemsController < ApplicationController
  def index
    items = Item.all
    render json: items.to_json, status: 200
  end

  def show
    if Item.exists?(params[:id])
      item = Item.find(params[:id])
      render json: item.to_json, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end

  def create
    if params[:name].nil? || params[:name].empty?
      err_msg = "The 'street_name' parameter was empty or not found"
      render json: { error_msg: err_msg }.to_json, status: 422
    else
      item = Item.new
      item.name = params[:name]
      item.price = params[:price]
      item.description = params[:description]
      item.save
      render json: item.to_json, status: 201
    end

  end

  def update
    if item.exists?(params[:id])
      item = item.find(params[:id])
      item.name = params[:name]
      item.price = params[:price]
      item.description = params[:description]
      item.save
      render json: item.to_json, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end

  def destroy
    if item.exists?(params[:id])
      item = item.find(params[:id])
      item.destroy
      render json: { message: "Item record Deleted Successfully." }, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end
end
