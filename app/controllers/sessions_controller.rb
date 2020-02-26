class SessionsController < ApplicationController

  def create
    user_info = request.env['omniauth.auth']
    session[:login] = user_info[:uid]
    if Artist.exists?(uid: user_info[:uid]) == false
      Artist.save_user_oauth_info(user_info)
      redirect_to new_shop_path
    # elsif user.name == ''
    #  user = Artist.find_by(uid: user_info[:uid])
    #  redirect_to user_path
    else
      Artist.update_user(user_info, current_user)
      redirect_to profile_path
    end
  end
end
