class PedalosController < ApplicationController

  def index
    @pedalos = Pedalo.all
  end

  def show
    @pedalo = Pedalo.find(params[:id])
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
