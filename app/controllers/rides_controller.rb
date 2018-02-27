class RidesController < ApplicationController

  def new
    @ride = Ride.create(user_id: params[:ride][:user_id], attraction_id: params[:ride][:attraction_id])
    flash[:alert] = @ride.take_ride
    redirect_to user_path(@user)
  end

end
