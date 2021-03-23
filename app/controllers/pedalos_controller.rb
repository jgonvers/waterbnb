class PedalosController < ApplicationController

  def index
    @pedalos = Pedalo.all
  end

  def show
    @pedalo = Pedalo.find(params[:id])
  end

  def new
  end

  def create
  end

end
