class SearchesController < ApplicationController

	def new
		@search = Search.new
		
	end

	def create
		@search = Search.create(search_params)
		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
		@vehicles = @search.search_vehicles.paginate(page: params[:page])
		Search.find(params[:id]).destroy
	end

	def destroy
	    
	end
	
	private
		def search_params
			params.require(:search).permit(:brand, :isCar, :min_price, :max_price, :start_date, :end_date)		
		end
end
