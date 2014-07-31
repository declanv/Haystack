class PinsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json

  def index
    pins = Pin.all
    render :json => pins.to_json, :callback => params['callback']
  end

  def create
    puts pin_params
    pin = Pin.create(pin_params)
    # respond_with pin
    # Comment to see if I can commmit
    render :json => pin.to_json, :callback => params['callback']
  end

  def pin_params
    params.require(:pin).permit(:name, :description, :photo_url, :pin_lat, :pin_long, :map_id)
  end
end




