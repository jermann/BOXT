class RatingsController < ApplicationController
  before_action :authenticate_user! # Ensure user is logged in

  def new
    @storage = Storage.find(params[:storage_id])
    @rating = @storage.ratings.new
  end

  def create
    @storage = Storage.find(params[:storage_id])
    @rating = @storage.ratings.new(rating_params.merge(user: current_user))

    if @rating.save
      redirect_to @storage, notice: 'Rating submitted successfully.'
    else
      render :new
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:value)
  end
end
