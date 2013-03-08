class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
  	@current_user ||= session[:user_id] ? User.find(session[:user_id]) : User.new_guest(request.remote_ip)
  end

  helper_method :current_user
end
