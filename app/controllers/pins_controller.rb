class PinsController < ApplicationController
  respond_to :json

  def create
    pin = Pin.create(pin_params)
    respond_with pin
  end

  def pin_params
    params.require(:pin).permit(:description, :photo_url, :pin_lat, :pin_long)
  end
end




