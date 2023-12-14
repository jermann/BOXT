class ProfileController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user.listing()

    @bookings = Booking.where(user_id: @user.id)
  end

  def update
    @booking = Booking.where(user_id: current_user.id, storage_id: params[:id]).first

    #@booking[:user_rating] = params[:booking][:user_rating]
    @booking.update_attribute(:user_rating, params[:booking][:user_rating])

    redirect_to profile_path(current_user)
  end

end