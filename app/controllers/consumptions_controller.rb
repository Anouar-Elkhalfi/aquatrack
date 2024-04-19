class ConsumptionsController < ApplicationController
  before_action :set_user

  def index
    @consumptions = @user.consumptions
    render json: @consumptions
  end

  def create
    @consumption = @user.consumptions.build(consumption_params)
    if @consumption.save
      render json: @consumption, status: :created
    else
      render json: @consumption.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def consumption_params
    params.require(:consumption).permit(:quantity, :recorded_at)
  end
end
