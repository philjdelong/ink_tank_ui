class ApplicationController < ActionController::Base

  def current_user
    @current_user ||= Artist.find_by(uid: session[:login]) if session[:login]
  end
end
