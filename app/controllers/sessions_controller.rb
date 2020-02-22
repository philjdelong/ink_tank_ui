class SessionsController < ApplicationController

  def create
    user_info = request.env['omniauth.auth']
    session[:github] = user_info[:uid]
    shop = Shop.first
    if User.exists?(uid: user_info[:uid]) == false
      User.create_user(shop, user_info)
      redirect_to new_shop_path
    else
      user = User.find_by(uid: user_info[:uid])
      user.update_user(user_info)
      redirect_to shop_user_path(user.id, user.shop.id)
    end
  end
end
