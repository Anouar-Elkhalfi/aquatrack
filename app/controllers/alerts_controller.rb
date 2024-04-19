class AlertsController < ApplicationController
  before_action :set_user

  def index
    @alerts = @user.alerts
    render json: @alerts
  end

  def create
    @alert = @user.alerts.build(alert_params)
    if @alert.save
      render json: @alert, status: :created
    else
      render json: @alert.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def alert_params
    params.require(:alert).permit(:message, :severity)
  end
end
