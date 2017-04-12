class RentalsController < ApplicationController
  before_action :get_user_and_vehicle,     only: [:create, :update, :destroy]
  before_action :get_rental,         only: [:update, :destroy]
  before_action :logged_in_user, only: [:new, :create, :update, :destroy]
  include SessionsHelper

  def new
    @rental = Rental.new
  end

  def create
    if available_to_rental?
      @rental = Rental.create(user_id:    current_user.id,
                              vehicle_id: params[:vehicle_id],
                              verified: false,
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
    if current_user.mod?
      # verify borrow book
      if params[:verify] 
          @rental.verify_rental
      # Send request extend time borrow books
      elsif params[:extend_book] 
        @borrowing.extend_due_time(@borrowing.time_extend)
      end
    # Non admin
    elsif current_user(@user) && params[:request_extend]
      check_extend_book(params[:extension_day])
    else
      flash[:danger] = "You did something wrong!"
    end
    redirect_to root_url
  end

  def destroy
    Rental.find(params[:id]).delete
    redirect_to '/'
  end

  private 
    def available_to_rental?
      if params[:rental][:start_at].blank? || params[:rental][:end_at].blank?
        return false 
      end
      true
    end

    def get_user_and_vehicle
      @user = User.find(params[:user_id])
      @vehicle = Vehicle.find(params[:vehicle_id])
    end

    def get_rental
      @rental = Rental.find_by(id: params[:id])
    end


end
