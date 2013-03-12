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

  def default_url_options(options={})
    { :lang => I18n.locale }
  end

  def mixpanel
    @mixpanel ||= Mixpanel::Tracker.new "848ac0603667c1e2dfbc89ba6d161271", :env => request.env, :persist => true
  end

  helper_method :current_user
  helper_method :mixpanel
end
