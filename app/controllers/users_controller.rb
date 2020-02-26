class UsersController < ApplicationController
  def new
    render locals: {
      user: current_user,
      tattoo_styles: Style.all
    }
  end

  def create
    render locals: {
      user: current_user,
      tattoo_styles: Style.all
    }
  end

  def index
  end

  def show
    render locals: { user: current_user }
  end

  def update
    current_user.complete_user(current_user, params)
    flash[:notice] = 'Registration complete!'
    redirect_to profile_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :price_per_hour, :bio)
  end
end
