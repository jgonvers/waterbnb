class ReservationsController < ApplicationController
  before_action :find_pedalo


  def index_res_pedalos
  end

  def index_res_users
  end

  def show
    find_pedalo
    @reservation = Reservation.find(params[:id])
  end

  def new
    find_pedalo
    @date = Time.now.strftime("%B %d, %Y")
    @reservation = Reservation.new
  end

  def create
    find_pedalo
    @reservation = Reservation.new(reservation_params)
    @reservation.pedalo = @pedalo
    @reservation.user = current_user
    @reservation.transaction_price = (@pedalo.price_per_hour.fdiv(100)) * ((@reservation.end_time - @reservation.start_time).fdiv(3600)).to_i
    if @reservation.save
      redirect_to pedalo_reservation_path(@pedalo.id, @reservation.id)
    else
      render :new
    end
  end

  def update
    find_pedalo
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_owner_param)
      redirect_to user_path
    else
      redirect_to pedalo_reservation_path(@pedalo.id, @reservation.id)
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_time, :end_time)
  end

  def reservation_owner_param
    params.require(:reservation).permit(:accepted)
  end

  def find_pedalo
    @pedalo = Pedalo.find(params[:pedalo_id])
  end
end
