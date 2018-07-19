class BusniessesController < ApplicationController
  before_action :check_for_login, :only => [:show, :invite, :new, :create]
  before_action :check_for_access, :only => [:show, :invite]
  before_action :check_for_admin, :only => [:invite]


  def show
    @busniess = Busniess.find params[:id]
    reports = @busniess.reports.order(:date)
    label_for_chart = reports.pluck_to_hash('date::date as label')
    sales_for_chart = reports.pluck_to_hash('sales::decimal as value')
    expenses_for_chart = reports.pluck_to_hash('expenses::decimal as value')
    profits_for_chart = reports.pluck(:sales, :expenses)
    profit = 0;
    profits_for_chart.each_with_index do |val, index|
      profit = profit + (val[0] ? val[0]:0) - (val[1] ? val[1]:0)
      profits_for_chart[index] = {"value"=>profit}
    end
    p profits_for_chart
    @chart = Fusioncharts::Chart.new({
        :height => "100%",
        :width => "100%",
        :type => "mscombi2d",
        :renderAt => "chartContainer",
        :dataSource => "{
              \"chart\":  {
                \"caption\": \"#{@busniess.name}\",
                \"xaxisname\": \"Date\",
                \"yaxisname\": \"AUD\",
                \"numberprefix\": \"$\",
                \"theme\": \"ocean\",
                \"exportEnabled\": \"1\"
            },
            \"categories\": [
                {
                    \"category\": #{label_for_chart.to_json}
                }
            ],
            \"dataset\": [
                {
                    \"seriesname\": \"Sales\",
                    \"data\": #{sales_for_chart.to_json}
                },
                {
                    \"seriesname\": \"Expenses\",
                    \"renderas\": \"line\",
                    \"showvalues\": \"0\",
                    \"data\": #{expenses_for_chart.to_json}
                },
                {
                    \"seriesname\": \"Profit\",
                    \"renderas\": \"area\",
                    \"showvalues\": \"0\",
                    \"data\": #{profits_for_chart.to_json}
                }
              ]
            }"
          })
  end

  def invite   # (invite needs to simplfy)
    @busniess = Busniess.find params[:id]
    if params[:email]  # check has email input
      user = User.find_by :email => params[:email]
      if user.present?
        if params[:admin_box]
          if user.is_admin(@busniess.id) # check if alrady a amin
            flash[:invite_result] = 'Already an admin !'
          else
            user.add_to_admin(@busniess.id)
            flash[:invite_result] = 'Successfully added!! (admin)'
          end
        else
          if user.is_admin(@busniess.id) # check if alrady a amin
            flash[:invite_result] = 'Already an admin !'
          elsif user.is_watching(@busniess.id)
            flash[:invite_result] = 'Already watching this busniess !'
          else
            user.add_to_watch(@busniess.id)
            flash[:invite_result] = 'Successfully added!! (watching)'
          end
        end
      elsif
        flash[:invite_result] = 'User not found !'
      end
      redirect_to busniess_invite_path(@busniess.id)
    end
  end

  def create
    busniess = Busniess.create busniess_params
    @current_user.add_to_admin(busniess.id)
    redirect_to root_path
  end

  def new
    @busniess = Busniess.new
  end

  def destroy
    @current_user.leave_busniess(params[:id])
    redirect_to root_path
  end

  private
  def busniess_params
    params.require(:busniess).permit(:name)
  end
end
