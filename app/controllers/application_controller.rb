class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_locale
 
  def set_locale
    I18n.locale = current_user.try(:locale) || I18n.default_locale
  end

  def error_log
    @error_log ||= Logger.new('log/errorlog.log')
    @error_log
  end
end
