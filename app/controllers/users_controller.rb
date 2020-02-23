class UsersController < ApplicationController
  def new
    @user = current_user
  end

  def create
    @user = current_user
  end

  def index
  end

  def show
  end

  def update
    current_user.complete_user(current_user, params)
  end

  private

  def user_params
    params.require(:user).permit(:name, :tattoo_styles, :price_per_hour, :bio)
  end
end
