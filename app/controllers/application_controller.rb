class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  private

  def set_locale
    I18n.locale = params[:lang] || I18n.default_locale
  end

  def current_user
  	@current_user ||= session[:user_id] ? User.find(session[:user_id]) : User.new_guest(request.remote_ip)
  end

  helper_method :current_user
end
