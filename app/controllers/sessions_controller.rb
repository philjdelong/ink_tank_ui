class SessionsController < ApplicationController

  def create
    user_info = request.env['omniauth.auth']
    session[:login] = user_info[:uid]
    if User.exists?(uid: user_info[:uid]) == false
      User.save_user_oauth_info(user_info)
      require "pry"; binding.pry
      redirect_to new_shop_path
    # elsif user.name == ''
    #  user = User.find_by(uid: user_info[:uid])
    #  redirect_to user_path
    else
      User.update_user(user_info, current_user)
      redirect_to profile_path
    end
  end
end
