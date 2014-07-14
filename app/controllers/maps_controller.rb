class MapsController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }
  respond_to :json

  def show
    maps = Map.where("user_id = #{params[:id]}")
    # maps = Map.find(params[:id])
    render :json => maps.to_json(:include => :pins)
  end

  def create
    map = Map.create(map_params)
    respond_with map
  end

  def update
    map = Map.find(params[:id])
    map.update(map_params)
    render :json => map
    # respond_with map
  end

  def map_params
    params.require(:map).permit(:name, :creator_id, :owner_id, :map_lat, :map_long)
  end
end

# {"maps": {"name": , "creator_id": , "owner_id": , "map_lat": , "map_long": }}
