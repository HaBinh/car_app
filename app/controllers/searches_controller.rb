class SearchesController < ApplicationController

	def new
		@search = Search.new
		
	end

	def create
		if params[:search][:start_date].present? && params[:search][:end_date].present? && params[:search][:start_date] > params[:search][:end_date]
		    flash[:warning] = "You did something wrong"     
		    redirect_to new_search_path
	    else 
			@search = Search.create(search_params)
			redirect_to @search
    	end
	end

	def show
		@search = Search.find(params[:id])
		@vehicles = @search.search_vehicles.paginate(page: params[:page])
		Search.find(params[:id]).destroy
	end

	private
		def search_params
			params.require(:search).permit(:brand, :isCar, :min_price, :max_price, :start_date, :end_date)		
		end
end
