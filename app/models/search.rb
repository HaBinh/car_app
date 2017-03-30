class Search < ApplicationRecord
	def search_vehicles
		vehicles = Vehicle.all

		vehicles = vehicles.where(["brand LIKE ?", "%#{brand}%"]) if brand.present?
		vehicles = vehicles.where(["isCar LIKE ?", isCar])
		vehicles = vehicles.where(["price >= ?", min_price]) if min_price.present?
		vehicles = vehicles.where(["price <= ?", max_price]) if max_price.present?
		vehicles = vehicles.where(["start_at > ?", end_date]).or(vehicles.where(["end_at < ?", start_date])) if start_date.present?
		return vehicles
	end

end
