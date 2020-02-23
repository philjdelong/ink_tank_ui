class ApplicationController < ActionController::Base

  def current_user
    @current_user ||= User.find_by(uid: session[:github]) if session[:github]
  end
end
