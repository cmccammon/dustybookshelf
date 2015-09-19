class AddressesController < ApplicationController
  def index
    addresses = Adress.all
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
