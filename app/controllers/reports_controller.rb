class ReportsController < ApplicationController
  before_action :check_for_login, :only => [:edit, :update, :new, :create]
  before_action :check_for_access, :only => [:edit, :update, :new, :create]
  before_action :check_for_admin, :only => [:edit, :update, :new]
  before_action :fetch_businesss, :only => [:new, :create, :destroy, :edit, :update]

  def edit
    @report = Report.find params[:report_id]
  end

  def update
    report = Report.find params[:report_id]
    report.update report_params
    redirect_to business_path(params[:business_id])
  end

  def new
    @report = Report.new
  end

  def create
    # check if report already exists
    check_exist = Report.find_by :date => params['report']['date'], :business_id => @current_business.id
    if check_exist.present?
      params['report']['sales'] = check_exist.sales + params['report']['sales'].to_d
      params['report']['expenses'] = check_exist.expenses + params['report']['expenses'].to_d
      unless params['report']['comments'].nil? || params['report']['comments'].empty?
        params['report']['comments'] =  "#{params['report']['comments']}, #{check_exist.comments}"
      else
        params['report']['comments'] = check_exist.comments
      end
      check_exist.update report_params
    else
      report = Report.create report_params
      @current_business.reports << report
    end
    redirect_to business_path(@current_business.id)
  end

  def destroy
    report = Report.find params[:id]
    report.destroy
    redirect_to business_path(report.business_id)
  end

  private
  def report_params
    params.require(:report).permit(:date, :sales, :expenses, :comments)
  end

  def fetch_businesss
    @current_business = Business.find_by :id => (params[:id]||params[:business_id]) if (params[:id]||params[:business_id]).present?
  end
end
