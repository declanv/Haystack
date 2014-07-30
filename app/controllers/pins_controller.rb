class PinsController < ApplicationController
  respond_to :json

  def create
    pin = Pin.create(pin_params)
    respond_with pin
    # Comment to see if I can commmit
  end

  def pin_params
    params.require(:pin).permit(:name, :description, :photo_url, :pin_lat, :pin_long, :map_id)
  end
end




