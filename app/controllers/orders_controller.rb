class OrdersController < ApplicationController
  def index
    orders = Order.all
    render json: orders.to_json, status: 200
  end

  def show
    if Order.exists?(params[:id])
      orderes = Order.find(params[:id])
      render json: orderes.to_json, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end

  def create
    if params[:item_id].nil? && params[:user_id].nil? || params[:item_id].empty? && params[:user_id].empty?
      err_msg = "The 'item_id' or 'user_id' parameter was empty or not found"
      render json: { error_msg: err_msg }.to_json, status: 422
    else
      order = Order.new
      order.item_id = params[:item_id]
      order.order_id = params[:order_id]
      order.quantity = params[:quantity]
      order.save
      render json: order.to_json, status: 201
    end

  end

  def update
    if Order.exists?(params[:id])
      order = Order.find(params[:id])
      order.street_name = params[:street_name]
      order.city = params[:city]
      order.state = params[:state]
      order.zip = params[:zip]
      order.save
      render json: order.to_json, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end

  def destroy
    if Order.exists?(params[:id])
      order = Order.find(params[:id])
      order.destroy
      render json: { message: "order record Deleted Successfully." }, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end
end
