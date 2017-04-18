class StaticPagesController < ApplicationController
  def home
  	if @user = current_user
      @willRentals = current_user.rentals.where(["status LIKE ? ", 1])
      @rentals = current_user.rentals.where(["status LIKE ? ", 0])
      @pastRentals = current_user.rentals.where(["status LIKE ? ", -1])
      
      @vehicles = get_vehicle(@rentals)
      @willVehicles = get_vehicle(@willRentals)
      @pastVehicles = get_vehicle(@pastRentals)
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def manage
    if params[:search_user_id]
      if @user = User.find_by(id: params[:search_user_id])
        @rentals = @user.rentals.where(["status LIKE ? ", 0])
        @willRentals = @user.rentals.where(["status LIKE ? ", 1])
      else
        flash[:warning] = "Not found user"
      end
    end
    store_location
  end

  private
  def get_vehicle(rentals)
    vehicles = Array.new
    rentals.each do |b| 
      vehicles << Vehicle.find_by(id: b.vehicle_id)
    end      
    vehicles
  end

end
