class MapsController < ApplicationController
  # skip_before_filter :verify_authenticity_token,
  #                    :if => Proc.new { |c| c.request.format == 'application/json' }
  skip_before_filter :verify_authenticity_token

  respond_to :json

  def index
    maps = Map.where("user_id = #{params[:id]}")
    # maps = Map.find(params[:id])
    render :json => maps.to_json(:include => :pins), :callback => params['callback']
  end

  def create
    puts map_params
    map = Map.create(map_params)
    render :json => map.to_json, :callback => params['callback']
  end

  def update
    map = Map.find(params[:id])
    map.update(map_params)
    render :json => map
    # respond_with map
  end

  def destroy
    map = Map.find(params[:id])
    map.destroy
    render :json => {:success=>'ok'}, :status=>204
  end

  def map_params
    params.require(:map).permit(:name, :creator_id, :user_id, :map_lat, :map_long)
  end
end

# {"maps": {"name": , "creator_id": , "owner_id": , "map_lat": , "map_long": }}
