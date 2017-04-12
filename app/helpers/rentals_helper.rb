module RentalsHelper
    def get_request
        Rental.where(verified: false)
    end
end
