class V1::WodsController < ApplicationController
  def index
    @wods = Wod.all
    render json: @wods, status: :ok
  end

  def create
    @wod = Wod.new(wod_params)

    if @wod.save
      render json: @wod, status: :ok
    else
      status: 500
    end
  end

  private

  def wod_params
    params.require(:wod).permit(:title, :date)
  end
end
