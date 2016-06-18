class Admin::BaseController < ApplicationController
  before_action :authorize_admin!
  after_filter :prepare_unobtrusive_flash

  def authorize_admin!
    redirect_to root_url unless current_user.admin?
  end
end
