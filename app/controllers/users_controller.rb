class UsersController < ApplicationController
  def new
    @shop = Shop.find(params[:id])
    @user = current_user
  end

  def create

  end

  def index
  end

  def show
  end

  def update
    current_user.complete_user(params)
  end
end
