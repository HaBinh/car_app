class VehiclesController < ApplicationController
  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      flash[:info] = "Successed"
    else 
      render 'new'
    end
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def vehicle_params
      params.require(:vehicle).permit(:isCar, :brand, :model, :price, :seat, :about)
    end

    # Before filters

    # def get_vehicle
    #   @vehicle = vehicle.find_by(email: params[:email])
    # end

end
