class ArtistsController < ApplicationController
  
  def new
    render locals: {
      artist: current_user,
      tattoo_styles: Style.all
    }
  end

  def create
    render locals: {
      artist: current_user,
      tattoo_styles: Style.all
    }
  end

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @shop = Shop.find(@artist.shop_id)
  end

  def update
    current_user.complete_user(current_user, params)
    flash[:notice] = 'Registration complete!'
    redirect_to new_shop_path
  end

  private

  def user_params
    params.require(:artist).permit(:name, :price_per_hour, :bio, :image)
  end
end
