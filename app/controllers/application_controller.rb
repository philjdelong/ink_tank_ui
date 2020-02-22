class ApplicationController < ActionController::Base

  def current_user
    @current_user ||= User.find_by(uid: session[:github]) if session[:github]
  end
end



# create default shop (seed) - done
# when creating user, set shop_id to default shop - done
# update user's shop_id once user has completed the shop flow
