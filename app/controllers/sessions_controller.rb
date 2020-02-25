class SessionsController < ApplicationController

  def create
    user_info = request.env['omniauth.auth']
    session[:login] = user_info[:uid]
    if User.exists?(uid: user_info[:uid]) == false
      User.create_user(user_info)
      redirect_to new_shop_path
    else
      User.update_user(user_info, current_user)
      redirect_to profile_path
    end
  end
end
