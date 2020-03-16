class ShopsController < ApplicationController

  def new
    @shop = Shop.new
    if params["/shops"]
      @new_shop = Shop.new(zip: params["/shops"][:zip_code])
      @shops = Shop.where(zip: params["/shops"][:zip_code])
    end

    render locals: { artist: current_user }
  end

  def create
    @shop = Shop.create(shop_params)
    if @shop.save
      current_user.update_user_shop(current_user, @shop.id)
      flash[:notice] = 'Shop successfully created'
      redirect_to new_artist_path
    else
      flash[:error] = @shop.errors.full_messages.to_sentence
    end
  end

  def show
    if params[:zip_code]
      @shop = Shop.where(params[:zip_code])
    else
      @shop = Shop.find(params[:id])
      @artists = @shop.artists
    end
  end

  def index
    if params[:shop_search]
      @shops = Shop.where(zip: params["shop_search"])
    else
      @shops = Shop.all
    end
  end

  def update
    shop = Shop.find(params[:shop_id])
    current_user.update_user_shop(current_user, shop.id)
    flash[:notice] = 'Shop successfully added'
    redirect_to profile_path
  end

  def shop_params
    params.require(:shop).permit(:name, :street_address, :city, :phone_number, :zip)
  end
end
