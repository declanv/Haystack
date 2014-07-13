class MapsController < ApplicationController
  respond_to :json

  def create


  end

  def map_params
    params.require(:user).permit(:name, :creator_id, :owner_id, :map_lat, :map_long)
  end
end
