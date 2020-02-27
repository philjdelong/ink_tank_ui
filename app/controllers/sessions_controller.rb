class SessionsController < ApplicationController

  def create
    user_info = request.env['omniauth.auth']
    session[:login] = user_info[:uid]
    if Artist.exists?(uid: user_info[:uid]) == false
      Artist.save_user_oauth_info(user_info)
      redirect_to new_shop_path
    else
      Artist.update_user(user_info, current_user)
      redirect_to profile_path
      @current_user = Artist.last
    end
  end
end
