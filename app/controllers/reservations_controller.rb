class ReservationsController < ApplicationController

  def index_res_pedalos
  end

  def index_res_users
  end

  def show
  end

  def new
    @date = Time.now.strftime("%B %d, %Y")
    @pedalo = Pedalo.find(params[:pedalo_id])
    @reservation = Reservation.new
    # do some JS if time to display the total price
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @user = current_user
    @pedalo = Pedalo.find(params[:pedalo_id])
    @reservation.pedalo_id = @pedalo.id
    @reservation.user_id = @user.id
    @reservation.transaction_price = 30
    if @reservation.save
      redirect_to pedalo_reservation_path(@pedalo.id, @reservation.id)
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_time, :end_time)
  end
end
