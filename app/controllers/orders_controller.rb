class OrdersController < ApplicationController
  def index
    orders = Order.all
    render json: courses.to_json, status: 200
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end
end
