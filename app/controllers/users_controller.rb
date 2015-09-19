class UsersController < ApplicationController
  def index
    users = User.all
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
