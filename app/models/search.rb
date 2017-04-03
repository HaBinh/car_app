class Search < ApplicationRecord
	def search_vehicles
		vehicles = Vehicle.all

		vehicles = vehicles.where(["brand LIKE ?", "%#{brand}%"]) if brand.present?
		vehicles = vehicles.where(["isCar LIKE ?", isCar]) if isCar != nil
		vehicles = vehicles.where(["price >= ?", min_price]) if min_price.present?
		vehicles = vehicles.where(["price <= ?", max_price]) if max_price.present?
		vehicles = vehicles.where('(start_at > :end_date) OR (end_at < :start_date) OR (end_at IS NULL) OR (start_at IS NULL)', end_date: end_date, start_date: start_date) if (start_date.present? and end_date.present?) 
		vehicles = vehicles.where('(start_at > :start_date) OR (end_at < :start_date) OR (end_at IS NULL) OR (start_at IS NULL)', start_date: start_date) if (start_date.present? and !end_date.present?) 
		vehicles = vehicles.where('(start_at > :end_date) OR (end_at < :end_date) OR (end_at IS NULL) OR (start_at IS NULL)', end_date: end_date) if (!start_date.present? and end_date.present?) 
		return vehicles
	end

end
