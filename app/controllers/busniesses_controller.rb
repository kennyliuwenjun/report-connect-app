class BusniessesController < ApplicationController
  before_action :check_for_login, :only => [:show, :invite]
  before_action :check_for_access, :only => [:show, :invite]
  before_action :check_for_admin, :only => [:invite]

  def show
    @busniess = Busniess.find params[:id]
  end

  def invite
    @busniess = Busniess.find params[:id]
    user = User.find_by :email => params[:email]
    if user.present? && flash[:add_admin_result]
      flash[:add_admin_result] = 'succ'
      redirect_to busniess_invite_path(@busniess.id)
    else
      flash[:add_admin_result] = "fail to add user"
      # redirect_to busniess_invite_path(@busniess.id)
    end
  end

  private
  def check_for_access
    @admin = Admin.find_by :user_id => session[:user_id], :busniess_id => params[:id] if session[:user_id].present?
    @watch = @current_user.busniesses.exists?(params[:id])
    redirect_to root_path unless @admin.present? || @watch.present?
  end

  def check_for_admin
    redirect_to root_path unless @admin.present?
  end
end
