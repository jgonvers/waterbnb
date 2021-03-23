class PedalosController < ApplicationController

  def index
  
  end

  def show
    @pedalo = Pedalo.find(params[:id])
  end

  def new
  end

  def create
  end

end
