class ShopsController < ApplicationController

  def new
    if params["/shops"]
      @new_shop = Shop.new(zip: params["/shops"][:zip_code])
      if Shop.exists?(zip: params["/shops"][:zip_code])
        @shops = Shop.where(zip: params["/shops"][:zip_code])
      else
        flash[:notice] = 'No shops found in that zipcode. Please create one.'
      end
    end
  end

  def create
    #investigate why shop_params are returning as blank, used model method as workaround
    shop = Shop.create_shop(params)
    if shop.save
      current_user.update_user_shop(current_user, shop.id)
      flash[:notice] = 'Shop successfully created'
      redirect_to new_user_path
    else
      flash[:error] = shop.errors.full_messages.to_sentence
    end
  end

  def show
    @shop = Shop.where(params[:zip_code])
  end

  def index
    @shops = Shop.all
  end


  def shop_params
    params.permit(:street_address, :city, :phone_number, :zip)
  end
end
