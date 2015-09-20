class UsersController < ApplicationController
  def index
    users = User.all
    render json: users.to_json, status: 200
  end

  def show
    if User.exists?(params[:id])
      user = User.find(params[:id])
      render json: user.to_json, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end

  def create
    if params[:first_name].nil? || params[:first_name].empty?
      err_msg = "The 'first_name' parameter was empty or not found"
      render json: { error_msg: err_msg }.to_json, status: 422
    else
      user = User.new
      user.first_name = params[:first_name]
      user.last_name = params[:last_name]
      user.age = params[:age]
      user.save
      render json: user.to_json, status: 201
    end

  end

  def update
    if User.exists?(params[:id])
      user = User.find(params[:id])
      user.street_name = params[:street_name]
      user.city = params[:city]
      user.state = params[:state]
      user.zip = params[:zip]
      user.save
      render json: user.to_json, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end

  def destroy
    if User.exists?(params[:id])
      user = User.find(params[:id])
      user.destroy
      render json: { message: "user record Deleted Successfully." }, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end
end
