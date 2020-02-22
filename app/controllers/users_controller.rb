class UsersController < ApplicationController
  def new
    #maybe don't need this now with default shop?
    @shop = Shop.find(params[:shop_id])
  end

  def create
  end

  def index
  end

  def show
  end

  def update
  end
end
