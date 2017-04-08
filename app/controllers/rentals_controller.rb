class RentalsController < ApplicationController
  before_action :logged_in_user, only: [:create, :update, :destroy]
  include SessionsHelper

  def new
    @rental = Rental.new
  end

  def create
    # @vehicle = Vehicle.find(params[:vehicle_id])
    if available_to_rental?
      @rental = Rental.create(user_id:    current_user.id,
                              vehicle_id: params[:vehicle_id],
                              verified: true,
                              start_at: params[:rental][:start_at],
                              end_at: params[:rental][:end_at])
      flash[:success] = "Request rental has been sent"
      redirect_to root_path
    else 
      flash[:warning] = "Date not available. Please choose again."     
      redirect_to new_rental_path(vehicle: params[:vehicle_id])
    end
  end

  def update
    borrowing = Borrowing.find(params[:id])
    unless params[:extension_day].empty?
      borrowing.update_attributes(request: params[:extension_day]+" days extension")
      flash[:success] = "Extesion requesst sent"
    else
      flash[:danger] = "No extension day input"
    end
    redirect_to '/'
  end

  def destroy
    Borrowing.find(params[:id]).delete
    redirect_to '/'
  end

  private 
    def available_to_rental?
      if params[:rental][:start_at].blank? || params[:rental][:end_at].blank?
        return false 
      end
      true
    end

end
