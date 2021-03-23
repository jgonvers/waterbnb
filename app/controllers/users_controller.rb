class UsersController < ApplicationController
  def homepage
    @pedalos = Pedalo.where(owner: current_user).to_a
    @reservations_owner = []
    @pedalos.each { |pedalo| Reservation.where(pedalo: pedalo).each { |res| @reservations_owner << res } }
    @reservations_owner_pending = []
    @pedalos.each do |pedalo|
      Reservation.where(pedalo: pedalo, accepted: "pending").each do |res|
        @reservations_owner_pending << res
      end
    end
    @reservations = Reservation.where(user: current_user)
  end
end
