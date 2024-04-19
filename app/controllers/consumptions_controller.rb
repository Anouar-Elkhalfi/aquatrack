class ConsumptionsController < ApplicationController
  def index
    @consumptions = Consumption.where(user_id: params[:user_id])
    render json: @consumptions
  end

  def create
    @consumption = Consumption.new(consumption_params)
    if @consumption.save
      render json: @consumption, status: :created
    else
      render json: @consumption.errors, status: :unprocessable_entity
    end
  end

  private

  def consumption_params
    params.require(:consumption).permit(:user_id, :quantity, :recorded_at)
  end
end
