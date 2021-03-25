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
    @pedalo = Pedalo.new
  end

  def create
    @pedalo = Pedalo.new(pedalo_params)
    @pedalo.owner = current_user
    if @pedalo.save
      redirect_to pedalos_path
    else
      render :new
    end
  end

  private

  def pedalo_params
    params.require(:pedalo).permit(:name, :description, :price_per_hour, :location, :photo)
  end
end
