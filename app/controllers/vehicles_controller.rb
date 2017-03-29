class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.paginate(page: params[:page])
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      flash[:succes] = "Successed"
      redirect_to 
    else 
      render 'new'
    end
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.update_attributes(vehicle_params)
      flash[:success] = "Vehicle updated"
      redirect_to 
    else
      render 'edit'
    end
  end

  def destroy
    Vehicle.find(params[:id]).destroy
    flash[:succes] = "Vehicle deleted"
    redirect_to vehicles_url
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
