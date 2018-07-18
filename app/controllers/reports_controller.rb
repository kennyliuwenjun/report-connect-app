class ReportsController < ApplicationController
  before_action :check_for_login, :only => [:edit, :update, :new, :create]
  before_action :check_for_access, :only => [:edit, :update, :new, :create]
  before_action :check_for_admin, :only => [:edit, :update, :new]
  before_action :fetch_busniesss, :only => [:new, :create, :destroy, :edit, :update]

  def edit
    @report = Report.find params[:report_id]
  end

  def update
    report = Report.find params[:report_id]
    report.update report_params
    redirect_to busniess_path(params[:busniess_id])
  end

  def new
    @report = Report.new
  end

  def create
    report = Report.create report_params
    @current_busniess.reports << report
    redirect_to busniess_path(@current_busniess.id)
  end

  def destroy
    report = Report.find params[:id]
    report.destroy
    redirect_to busniess_path(report.busniess_id)
  end

  private
  def report_params
    params.require(:report).permit(:date, :sales, :expenses, :comments)
  end

  def fetch_busniesss
    @current_busniess = Busniess.find_by :id => (params[:id]||params[:busniess_id]) if (params[:id]||params[:busniess_id]).present?
  end
end
