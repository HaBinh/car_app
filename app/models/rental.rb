class Rental < ApplicationRecord
	belongs_to :user
	belongs_to :vehicle

    def verify_rental
        update_columns(verified: true)
    end
end
