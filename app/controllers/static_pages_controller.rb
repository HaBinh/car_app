class StaticPagesController < ApplicationController
  def home
  	if logged_in?
      @rentals = current_user.rentals.where(["status LIKE ? ", -1])
      @vehicles = Array.new
      @date = Array.new
      @rentals.each {|b| @vehicles << Vehicle.find_by(id: b.vehicle_id)}      
    end
  end

  def help
  end

  def about
  end

  def contact
  end

end
