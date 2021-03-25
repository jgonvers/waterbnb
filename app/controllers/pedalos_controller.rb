class PedalosController < ApplicationController

  def index
    @pedalos = Pedalo.all
    @markers = @pedalos.geocoded.map do |pedalo|
      {
        lat: pedalo.latitude,
        lng: pedalo.longitude
      }
    end
  end

  def show
    @pedalo = Pedalo.find(params[:id])
    # @marker = @pedalo.geocoded.map do |pedalo|
    #   {
    #     lat: pedalo.latitude,
    #     lng: pedalo.longitude
    #   }
    # end
  end

  def new
  end

  def create
  end
end
