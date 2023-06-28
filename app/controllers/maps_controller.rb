class MapsController < ApplicationController
  def index
    @maps = Response.all
    @lat = @lon= nil
    if params[:lat] and params[:lon]
      @lat = params[:lat].to_i
      @lon = params[:lon].to_i
    end
    @id =  params[:id].to_i
  end
end
