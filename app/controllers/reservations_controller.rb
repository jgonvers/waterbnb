class ReservationsController < ApplicationController
  before_action :find_pedalo

  def index_res_pedalos
    @sorted_reservations = []
    Reservation.where(pedalo: @pedalo).each { |res| @sorted_reservations << res }
    @sorted_reservations = @sorted_reservations.sort { |res1, res2| sort_reservation(res1, res2) }
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
    @reservation.transaction_price = @pedalo.price_per_hour * (@reservation.end_time - @reservation.start_time).fdiv(3600).to_i
    if @reservation.save
      redirect_to reservation_path(@reservation.id)
    else
      render :new
    end
  end

  def update
    find_pedalo
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_owner_param)
      redirect_to user_path # check link when route change
    else
      redirect_to reservation_path(@reservation.id)
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

  def sort_reservation(res1, res2)
    # res1 > res2 -> 1
    # res1 = res2 -> 0
    # res1 < res2 -> -1
    # pending avant autre, suivit de chronologique (start_time)

    return -1 if res1.accepted == "pending" && res2.accepted != "pending"

    return 1 if res1.accepted != "pending" && res2.accepted == "pending"

    return res1.start_time <=> res2.start_time
  end

  def after_date?(reservation, date)
    reservation.start_time >= date
  end
end
