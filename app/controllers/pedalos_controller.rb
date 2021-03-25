class PedalosController < ApplicationController

  def index
    @pedalos = Pedalo.all
    @markers = @pedalos.geocoded.map do |pedalo|
      {
        lat: pedalo.latitude,
        lng: pedalo.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { pedalo: pedalo })
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
