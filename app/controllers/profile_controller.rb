class ProfileController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user.listing()

    @bookings = Booking.where(user_id: @user.id)
  end

  def update
    @booking = Booking.where(user_id: current_user.id, storage_id: params[:id]).first
    @storage = Storage.find(params[:id])

    #@booking[:user_rating] = params[:booking][:user_rating]
    @booking.update_attribute(:user_rating, params[:booking][:user_rating])

    all_storages = Booking.where(storage_id: params[:id]).where.not(user_rating: [nil, ""])
    sum = 0.0
    count = 0.0
  
    all_storages.each do |s|

      count = count + 1
      sum = sum + s.user_rating.to_f

    end

    new_avg_rating = sum/count
    rounded_new_avg_rating = new_avg_rating.round(2)

    @storage.update_attribute(:rating, rounded_new_avg_rating)

    redirect_to profile_path(current_user)
  end

end