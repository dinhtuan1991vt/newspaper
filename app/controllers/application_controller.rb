class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    locale = I18n.default_locale
    if params[:locale]
      locale = params[:locale]
      session[:locale] = params[:locale]
    elsif session[:locale]
      locale = session[:locale]
    end

    I18n.locale = locale
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

end
