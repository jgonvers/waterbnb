class ReviewsController < ApplicationController
  def new
    @new_review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.reservation_id = params[:reservation_id]
    if @review.save
      redirect_to pedalo_path(Reservation.find(params[:reservation_id]).pedalo)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
