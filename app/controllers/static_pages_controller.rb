class StaticPagesController < ApplicationController
  def home
  	if @user = current_user
      @rentals = current_user.rentals.where(["status LIKE ? ", -1])
      @vehicles = Array.new
      @rentals.each do |b| 
        @vehicles << Vehicle.find_by(id: b.vehicle_id)
        end      
    end
  end

  def help
  end

  def about
  end

  def contact
  end

end
