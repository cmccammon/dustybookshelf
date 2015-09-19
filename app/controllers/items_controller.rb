class ItemsController < ApplicationController
  def index
    items = Item.all
    render json: items.to_json, status: 200
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
