module VehiclesHelper
    def current_vehicle
        Vehicle.find(session[:vehicle_id])
    end
end
