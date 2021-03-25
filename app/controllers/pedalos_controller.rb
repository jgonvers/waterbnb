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
  end

  private

  def pedalo_params
    params.require(:pedalo).permit(:name, :description, :price_per_hour, :photo)
  end
end
