class SessionsController < ApplicationController

  def create
    user_info = request.env['omniauth.auth']
    session[:login] = user_info[:uid]
    if Artist.exists?(uid: user_info[:uid]) == false
      Artist.save_user_oauth_info(user_info)
      redirect_to new_shop_path
    else
<<<<<<< HEAD

      User.update_user(user_info, current_user)
=======
      Artist.update_user(user_info, current_user)
>>>>>>> 3d73be17506c1eba587ee054a27e000ec900c788
      redirect_to profile_path
      @current_user = User.last
    end
  end
end
