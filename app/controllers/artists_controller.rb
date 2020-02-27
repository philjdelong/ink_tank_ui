class ArtistsController < ApplicationController
  def new
    require "pry"; binding.pry
    render locals: {
      artist: current_user,
      tattoo_styles: Style.all
    }
  end

  def create
    require "pry"; binding.pry
    render locals: {
      artist: current_user,
      tattoo_styles: Style.all
    }
  end

  def index
    @artists = Artist.all
  end

  def update
    require "pry"; binding.pry
    current_user.complete_user(current_user, params)
    flash[:notice] = 'Registration complete!'
    redirect_to new_shop_path
  end

  def show
    require "pry"; binding.pry
    render locals: { artist: current_user }
  end


  private

  def user_params
    params.require(:artist).permit(:name, :price_per_hour, :bio)
  end
end
