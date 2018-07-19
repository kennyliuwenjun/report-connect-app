class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionHelper
  before_action :fetch_user

  private
  def fetch_user
    @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
    session[:user_id] = nil unless @current_user.present? # This prevents horrors when reseeding
  end

  def check_for_login
    redirect_to login_path unless @current_user.present?
  end

  def check_for_access
    @admin = Admin.find_by :user_id => @current_user.id, :business_id => (params[:id]||params[:business_id]) if @current_user.present?
    @watch = @current_user.businesses.exists?(params[:id]||params[:business_id])
    redirect_to root_path unless @admin.present? || @watch.present?
  end

  def check_for_admin
    redirect_to root_path unless @admin.present?
  end
end
